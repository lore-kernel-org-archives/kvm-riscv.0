Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261CCC71135
	for <kvm-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 00:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6fE6XOWSHVxkiPIKvu2MoCjopXhzyWENndXEaoyg8Q=; b=SvvAIycgNCYHFV
	if59bVwaQn84ejVqrLhqBFMNErrAvQWJwuHeU/zD6dUiXwxm8qF6DSCxI46EHNvpvClBbQeyotxm1
	kUk2r8WNRPXpXfHkSsuOEtRUN46uunaM33oBjkjPE4Rjnc7hobra8AVHi8bRw0GHfhCoYPNRad6Zg
	b55gD1nTnwNgFS07ol9mjUEl5bozS8xqHcZ/UN8zvP5EmxG4Dyeos+8xuVAI8KFLvRpNNN2OphfCQ
	dLoudpMFfTc6rN2KE9oxidDY+A4W4YLKIX0K6AZpEOpA/8X2SvFnyGplI9DdjqqijUOqNacB2S8go
	iwQXiNq0/ndJ3bAUzJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQF3T-00000000Qsh-3E7l;
	Sat, 14 Jun 2025 00:47:31 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQF3R-00000000Qrp-0d8u
	for kvm-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 00:47:30 +0000
Message-ID: <f60715b1-3d15-4929-95c6-f21b433c14c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749862047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzvEnJHeRWwDZLaUSOe8vqoCojm1nty38UfDyMGsc1I=;
	b=s4zK3NXhh6sDB8D0PyKptlOn6KfFHjeJdB/DX+lfO4Rz7irNI0NmjoVF6SrrzuT54b2rPv
	Oh5gUqaVEPt0xllkEaIWwsz5Yo9VbNdQlC8LgN2gMPEUnN6gLSawr352WGsZA7Yz375v4P
	zeH3m6SRfoIEx/mXQ/O6/TFfYAAx5bM=
Date: Fri, 13 Jun 2025 17:46:38 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/12] RISC-V: KVM: Use ncsr_xyz() in
 kvm_riscv_vcpu_trap_redirect()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613065743.737102-1-apatel@ventanamicro.com>
 <20250613065743.737102-8-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250613065743.737102-8-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_174729_344592_04CC7D40 
X-CRM114-Status: GOOD (  11.96  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 6/12/25 11:57 PM, Anup Patel wrote:
> The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
> trap when KVM RISC-V is running as Guest/VM hence remove these traps
> by using ncsr_xyz() instead of csr_xyz().
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu_exit.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 6e0c18412795..85c43c83e3b9 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -9,6 +9,7 @@
>   #include <linux/kvm_host.h>
>   #include <asm/csr.h>
>   #include <asm/insn-def.h>
> +#include <asm/kvm_nacl.h>
>   
>   static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>   			     struct kvm_cpu_trap *trap)
> @@ -135,7 +136,7 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>   void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>   				  struct kvm_cpu_trap *trap)
>   {
> -	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
> +	unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
>   
>   	/* Change Guest SSTATUS.SPP bit */
>   	vsstatus &= ~SR_SPP;
> @@ -151,15 +152,15 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>   	vsstatus &= ~SR_SIE;
>   
>   	/* Update Guest SSTATUS */
> -	csr_write(CSR_VSSTATUS, vsstatus);
> +	ncsr_write(CSR_VSSTATUS, vsstatus);
>   
>   	/* Update Guest SCAUSE, STVAL, and SEPC */
> -	csr_write(CSR_VSCAUSE, trap->scause);
> -	csr_write(CSR_VSTVAL, trap->stval);
> -	csr_write(CSR_VSEPC, trap->sepc);
> +	ncsr_write(CSR_VSCAUSE, trap->scause);
> +	ncsr_write(CSR_VSTVAL, trap->stval);
> +	ncsr_write(CSR_VSEPC, trap->sepc);
>   
>   	/* Set Guest PC to Guest exception vector */
> -	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +	vcpu->arch.guest_context.sepc = ncsr_read(CSR_VSTVEC);
>   
>   	/* Set Guest privilege mode to supervisor */
>   	vcpu->arch.guest_context.sstatus |= SR_SPP;


Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
