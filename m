From: Thomas Huth <thuth@redhat.com>
Date: Wed, 4 Sep 2024 08:12:25 +0200
Subject: [kvm-unit-tests PATCH 1/3] riscv: Drop mstrict-align
In-Reply-To: <20240903163046.869262-6-andrew.jones@linux.dev>
References: <20240903163046.869262-5-andrew.jones@linux.dev>
 <20240903163046.869262-6-andrew.jones@linux.dev>
Message-ID: <7ef4ee12-ce0b-41e6-904a-ff43ee571be1@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/09/2024 18.30, Andrew Jones wrote:
> The spec says unaligned accesses are supported, so this isn't required
> and clang doesn't support it. A platform might have slow unaligned
> accesses, but kvm-unit-tests isn't about speed anyway.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   riscv/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index 179a373dbacf..2ee7c5bb5ad8 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -76,7 +76,7 @@ LDFLAGS += -melf32lriscv
>   endif
>   CFLAGS += -DCONFIG_RELOC
>   CFLAGS += -mcmodel=medany
> -CFLAGS += -mstrict-align
> +#CFLAGS += -mstrict-align
>   CFLAGS += -std=gnu99
>   CFLAGS += -ffreestanding
>   CFLAGS += -O2

Reviewed-by: Thomas Huth <thuth@redhat.com>


