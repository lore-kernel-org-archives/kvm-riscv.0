Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E62C7EE32
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:References:Date:To:
	In-Reply-To:Cc:Mime-Version:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgackMHmmSdTYVWMYGu4iPyexUQCc2QmUVm2Kml9Afw=; b=mtX+kkir9U4s5T
	BE4WjWRlI5+hyYYOZ2r08LL8CMgbWI/ytTRcK0n363QhFUUx8ctCYgzjhwZVaZCKkk8WoSOR/368W
	tfFoLWdAFSZwAy8iVgaIPDlTTHf/FxHvZGmEgJHK0MOTXwKRh9f6h5NMhzvFa8+B3yGxCuM9OIz+p
	RG36kB6uvlpqBxn0EflrpOaYn65CMLcSaxCLTYdA0qqeHPOc0xbX8Ryahyj6HWCOOM+zQ7zBLSgBx
	rtsRoBBlGPGVa0xVSpl+kEYsjngSnLzNTTZ//ndANokY/Gd44bk2o16BWbY38NDnjTTfHvrn3/aoU
	80gs0x8tqxGw9aCfqHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULcl-00000007ybm-0NFV;
	Wed, 25 Jun 2025 08:36:55 +0000
Received: from sg-3-19.ptr.tlmpb.com ([101.45.255.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKjk-00000007qd7-0NHO
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837193;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yzsraZSWqwSvVbcAdyXaFFgenrSPFsa+2FOgTUwiozM=;
 b=j+dxlps+gqW75WVPPsqWlJvqwvDuXfQft+a69WvTgKMfG1ztI7NAwby5qicDw6C1+PSBxw
 anus9AjfqKrhz+CeM1ftngoAyn6nIG/2al8nXPvRgFxxZoDZRJQ9dz2n49mku6rDE6IsPV
 EQiJgGU6FXMYxuoUupl7koWKIUCmuDGPCEFuFUgutgoFLDUXrcpwohxK9/JTytFS/8AWqO
 bcBc/nmibBonzP9JG+TOhkRmLQFUxfEee0VnXIjfv57q+3semoTOuB6gZcfPqmdruAGMrP
 z0y6cFdUQCLmm8C28TzINWZdhEGMCEctyUnaBMFooxCKHWz/xXXmB4YZDXq3vg==
Content-Language: en-US
Subject: Re: [PATCH v3 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Mime-Version: 1.0
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:39:50 +0800
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
In-Reply-To: <20250618113532.471448-8-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
X-Lms-Return-Path: <lba+2685ba7c7+14a66b+lists.infradead.org+liujingqi@lanxincomputing.com>
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Date: Wed, 25 Jun 2025 15:39:48 +0800
User-Agent: Mozilla Thunderbird
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-8-apatel@ventanamicro.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Message-Id: <88b20a43-46c7-4297-ac20-dea7b0157c92@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_004004_492583_5AFAB58B 
X-CRM114-Status: GOOD (  11.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 6/18/2025 7:35 PM, Anup Patel wrote:
> The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
> trap when KVM RISC-V is running as Guest/VM hence remove these traps
> by using ncsr_xyz() instead of csr_xyz().
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
