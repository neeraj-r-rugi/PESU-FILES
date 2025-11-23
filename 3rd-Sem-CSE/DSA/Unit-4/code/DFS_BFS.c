#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX 100

// ==================== ADJACENCY LIST REPRESENTATION ====================

// Structure for adjacency list node
typedef struct Node {
    int vertex;
    struct Node* next;
} Node;

// Structure for graph using adjacency list
typedef struct Graph {
    int numVertices;
    Node** adjLists;
    bool* visited;
} Graph;

// Create a node
Node* createNode(int v) {
    Node* newNode = malloc(sizeof(Node));
    newNode->vertex = v;
    newNode->next = NULL;
    return newNode;
}

// Create a graph (adjacency list)
Graph* createGraph(int vertices) {
    Graph* graph = malloc(sizeof(Graph));
    graph->numVertices = vertices;
    graph->adjLists = malloc(vertices * sizeof(Node*));
    graph->visited = malloc(vertices * sizeof(bool));
    
    for (int i = 0; i < vertices; i++) {
        graph->adjLists[i] = NULL;
        graph->visited[i] = false;
    }
    return graph;
}

// Add edge to graph (adjacency list)
void addEdge(Graph* graph, int src, int dest) {
    // Add edge from src to dest
    Node* newNode = createNode(dest);
    newNode->next = graph->adjLists[src];
    graph->adjLists[src] = newNode;
    
    // For undirected graph, add edge from dest to src
    newNode = createNode(src);
    newNode->next = graph->adjLists[dest];
    graph->adjLists[dest] = newNode;
}

// DFS for adjacency list
void DFS_List(Graph* graph, int vertex) {
    Node* adjList = graph->adjLists[vertex];
    graph->visited[vertex] = true;
    printf("%d ", vertex);
    
    while (adjList != NULL) {
        int connectedVertex = adjList->vertex;
        if (!graph->visited[connectedVertex]) {
            DFS_List(graph, connectedVertex);
        }
        adjList = adjList->next;
    }
}

// Queue structure for BFS
typedef struct Queue {
    int items[MAX];
    int front;
    int rear;
} Queue;

Queue* createQueue() {
    Queue* q = malloc(sizeof(Queue));
    q->front = -1;
    q->rear = -1;
    return q;
}

bool isEmpty(Queue* q) {
    return q->rear == -1;
}

void enqueue(Queue* q, int value) {
    if (q->rear == MAX - 1)
        return;
    if (q->front == -1)
        q->front = 0;
    q->rear++;
    q->items[q->rear] = value;
}

int dequeue(Queue* q) {
    int item;
    if (isEmpty(q))
        return -1;
    item = q->items[q->front];
    q->front++;
    if (q->front > q->rear) {
        q->front = q->rear = -1;
    }
    return item;
}

// BFS for adjacency list
void BFS_List(Graph* graph, int startVertex) {
    Queue* q = createQueue();
    
    graph->visited[startVertex] = true;
    enqueue(q, startVertex);
    
    while (!isEmpty(q)) {
        int currentVertex = dequeue(q);
        printf("%d ", currentVertex);
        
        Node* temp = graph->adjLists[currentVertex];
        while (temp) {
            int adjVertex = temp->vertex;
            if (!graph->visited[adjVertex]) {
                graph->visited[adjVertex] = true;
                enqueue(q, adjVertex);
            }
            temp = temp->next;
        }
    }
    free(q);
}

// Reset visited array
void resetVisited(Graph* graph) {
    for (int i = 0; i < graph->numVertices; i++) {
        graph->visited[i] = false;
    }
}

// ==================== ADJACENCY MATRIX REPRESENTATION ====================

// Structure for graph using adjacency matrix
typedef struct GraphMatrix {
    int numVertices;
    int adjMatrix[MAX][MAX];
    bool visited[MAX];
} GraphMatrix;

// Create graph (adjacency matrix)
GraphMatrix* createGraphMatrix(int vertices) {
    GraphMatrix* graph = malloc(sizeof(GraphMatrix));
    graph->numVertices = vertices;
    
    for (int i = 0; i < vertices; i++) {
        graph->visited[i] = false;
        for (int j = 0; j < vertices; j++) {
            graph->adjMatrix[i][j] = 0;
        }
    }
    return graph;
}

// Add edge to graph (adjacency matrix)
void addEdgeMatrix(GraphMatrix* graph, int src, int dest) {
    graph->adjMatrix[src][dest] = 1;
    graph->adjMatrix[dest][src] = 1;  // For undirected graph
}

// DFS for adjacency matrix
void DFS_Matrix(GraphMatrix* graph, int vertex) {
    graph->visited[vertex] = true;
    printf("%d ", vertex);
    
    for (int i = 0; i < graph->numVertices; i++) {
        if (graph->adjMatrix[vertex][i] == 1 && !graph->visited[i]) {
            DFS_Matrix(graph, i);
        }
    }
}

// BFS for adjacency matrix
void BFS_Matrix(GraphMatrix* graph, int startVertex) {
    Queue* q = createQueue();
    
    graph->visited[startVertex] = true;
    enqueue(q, startVertex);
    
    while (!isEmpty(q)) {
        int currentVertex = dequeue(q);
        printf("%d ", currentVertex);
        
        for (int i = 0; i < graph->numVertices; i++) {
            if (graph->adjMatrix[currentVertex][i] == 1 && !graph->visited[i]) {
                graph->visited[i] = true;
                enqueue(q, i);
            }
        }
    }
    free(q);
}

// Reset visited array for matrix
void resetVisitedMatrix(GraphMatrix* graph) {
    for (int i = 0; i < graph->numVertices; i++) {
        graph->visited[i] = false;
    }
}

// ==================== MAIN FUNCTION ====================

int main() {
    printf("========== ADJACENCY LIST REPRESENTATION ==========\n\n");
    
    // Create graph with 6 vertices
    Graph* graph = createGraph(6);
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 2);
    addEdge(graph, 1, 3);
    addEdge(graph, 1, 4);
    addEdge(graph, 2, 4);
    addEdge(graph, 3, 5);
    addEdge(graph, 4, 5);
    
    printf("DFS traversal (starting from vertex 0): ");
    DFS_List(graph, 0);
    printf("\n");
    
    resetVisited(graph);
    
    printf("BFS traversal (starting from vertex 0): ");
    BFS_List(graph, 0);
    printf("\n\n");
    
    printf("========== ADJACENCY MATRIX REPRESENTATION ==========\n\n");
    
    // Create graph with 6 vertices
    GraphMatrix* graphMatrix = createGraphMatrix(6);
    addEdgeMatrix(graphMatrix, 0, 1);
    addEdgeMatrix(graphMatrix, 0, 2);
    addEdgeMatrix(graphMatrix, 1, 3);
    addEdgeMatrix(graphMatrix, 1, 4);
    addEdgeMatrix(graphMatrix, 2, 4);
    addEdgeMatrix(graphMatrix, 3, 5);
    addEdgeMatrix(graphMatrix, 4, 5);
    
    printf("DFS traversal (starting from vertex 0): ");
    DFS_Matrix(graphMatrix, 0);
    printf("\n");
    
    resetVisitedMatrix(graphMatrix);
    
    printf("BFS traversal (starting from vertex 0): ");
    BFS_Matrix(graphMatrix, 0);
    printf("\n");
    
    // Free memory
    free(graph->adjLists);
    free(graph->visited);
    free(graph);
    free(graphMatrix);
    
    return 0;
}