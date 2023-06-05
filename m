From: Zhi Wang <zhi.wang.linux@gmail.com>
Date: Mon, 5 Jun 2023 22:35:20 +0800
Subject: [PATCH v2 09/16] KVM: arm64: Document the page table walker
 actions based on the callback's return value
In-Reply-To: <20230602160914.4011728-10-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
	<20230602160914.4011728-10-vipinsh@google.com>
Message-ID: <20230605223520.00007fbd.zhi.wang.linux@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  2 Jun 2023 09:09:07 -0700
Vipin Sharma <vipinsh@google.com> wrote:

> Document what the page table walker do when walker callback function returns
> a value.
> 
> Current documentation is not correct as negative error of -EAGAIN on a
> non-shared page table walker doesn't terminate the walker and continues
> to the next step.
> 
> There might be a better place to keep this information, for now this
> documentation will work as a reference guide until a better way is
> found.
>

After reading the whole patch series, I was thinking it might be a good
time to improve the way how the visitor function and page table walker
talk to each other. The error code is good enough before, but its meaning
seems limited and vague when the visitor function wants to express more about
what exactly happens inside. I am not sure if it is a good idea to continue
that way: 1. found a new situation. 2. choosing a error code for visitor
function. 3. walker translates the error code into the situation to
handle. 4. document the error code and its actual meaning.

Eventually I am afraid that we are going to abuse the error code.

What about introducing a set of flags for the visitor function to express
what happened and simplify the existing error code?

> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 8ef7e8f3f054..957bc20dab00 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -711,8 +711,19 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
>   * after invoking the walker callback, allowing the walker to descend into
>   * a newly installed table.
>   *
> - * Returning a negative error code from the walker callback function will
> - * terminate the walk immediately with the same error code.
> + * Depending on the return value from the walker callback function, the page
> + * table walk will continue or exit the walk. This is also dependent on the
> + * type of the walker, i.e. shared walker (vCPU fault handlers) or non-shared
> + * walker.
> + *
> + * Walker Type  | Callback         | Walker action
> + * -------------|------------------|--------------
> + * Non-Shared   | 0                | Continue
> + * Non-Shared   | -EAGAIN          | Continue
> + * Non-Shared   | Any other        | Exit
> + * -------------|------------------|--------------
> + * Shared       | 0                | Continue
> + * Shared       | Any other        | Exit
>   *
>   * Return: 0 on success, negative error code on failure.
>   */


