From: Andreas Schwab <schwab@suse.de>
Date: Tue, 08 Nov 2022 13:18:06 +0100
Subject: [PATCH] RISC-V: KVM: Exit run-loop immediately if xfer_to_guest
 fails
In-Reply-To: <20221108115543.1425199-1-apatel@ventanamicro.com> (Anup Patel's
	message of "Tue, 8 Nov 2022 17:25:43 +0530")
References: <20221108115543.1425199-1-apatel@ventanamicro.com>
Message-ID: <mvmiljpd4ht.fsf@suse.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 08 2022, Anup Patel wrote:

> If xfer_to_guest_mode_handle_work() fails in the run-loop then exit
> the run-loop immediately instead of doing it after some more work.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 71ebbc4821f0..17d5b3f8c2ee 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -984,8 +984,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	while (ret > 0) {
>  		/* Check conditions before entering the guest */
>  		ret = xfer_to_guest_mode_handle_work(vcpu);
> -		if (!ret)
> -			ret = 1;
> +		if (ret)
> +			continue;

If that is supposed to exit the loop, it would be clearer to just use
break.

> +		ret = 1;

There is a condition on ret <= 0 later in the loop that no longer can be
true.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

