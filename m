From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Dec 2021 11:51:03 +0530
Subject: [PATCH v4 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level
 Makefile
In-Reply-To: <20211224073604.1085464-4-anup.patel@wdc.com>
References: <20211224073604.1085464-1-anup.patel@wdc.com>
 <20211224073604.1085464-4-anup.patel@wdc.com>
Message-ID: <CAAhSdy0jN-Nz_jWXgvrfRVzS5=vRPWjBp+hytU1fA0nyVsq20w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 24, 2021 at 1:06 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile which will
> allow users to pass additional compile-time flags such as "-static".
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-and-tested-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-and-tested-by: Sean Christopherson <seanjc@google.com>

Queued this patch for 5.17

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index f307c9f61981..3c839c01d4fd 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -132,7 +132,7 @@ endif
>  CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
>         -fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
>         -I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
> -       -I$(<D) -Iinclude/$(UNAME_M) -I..
> +       -I$(<D) -Iinclude/$(UNAME_M) -I.. $(EXTRA_CFLAGS)
>
>  no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
>          $(CC) -Werror -no-pie -x c - -o "$$TMP", -no-pie)
> --
> 2.25.1
>

