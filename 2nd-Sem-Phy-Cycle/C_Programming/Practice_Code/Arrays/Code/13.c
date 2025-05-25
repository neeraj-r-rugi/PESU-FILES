#include&lt;stdio.h&gt;
int main(){
	printf(&quot;Enter The number of elements you want\n&quot;);
	int len;
	scanf(&quot;%d&quot;, &amp;len);
	int a[len];
	int out[len];
	int temp;
	int alraedy_present = 0;
	int ele = 0;

	printf(&quot;Enter Values: \n&quot;);
	for(int i = 0; i &lt; len; i++){
		scanf(&quot;%d&quot;, &amp;a[i]);
	}
	for(int i = 0; i &lt; len; i++){
		temp = a[i];
		for(int j= 0; j &lt; len;j++){
			if(temp == out[j]){
				alraedy_present = 1;
				break;
			}
		}
		if(!alraedy_present){
			out[ele] = temp;
			ele++;
		}
		alraedy_present = 0;
	}
	printf(&quot;The array after removing duplicates is: \n&quot;);
	for(int i = 0; i &lt; ele; i++){
		printf(&quot;%d\n&quot;, out[i]);
	}
	return 0;
}
