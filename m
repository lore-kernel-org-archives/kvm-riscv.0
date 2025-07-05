Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16423C8303D
	for <kvm-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66fGlOs2MfbD9o3tgyBKpI7SMKVLyJMK3rv6nq1hrpY=; b=2cqAxxBmyGMEB4
	E+tLuPlBS6MBcA9CkZNWd2CeGYKt89VZYKFTgw8p35RRjFdM+rDAFL34/ZT06N93H2f1IKN+8jqEw
	RYiCGoTyuDkkqGX3a0xTrLEANHGYWtYFcc0OjBLWaZQd6bFkd4sJV8LpF4VmAnA0E85Hzr9ViJ86T
	yQyT4dKJdFIY0jkTDIeNtjm5iJjys4bUuUwDnUyLzq505dLnxBelHEaLpCMLuG9WR/CM7MwedzfCP
	NuKh7m6VlLjwBM51UChlO15BaMn3AfuOdlqX5AviHgGOhq9EuhFj/VkmvpxQRiDDvKUu248bb3ZrP
	tXfzN8iH+OA+aNvCUECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxi9-0000000GFb5-3FbV;
	Sat, 05 Jul 2025 07:53:25 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxY1-0000000GEoo-2Yug
	for kvm-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:42:59 +0000
Message-ID: <88ef2551-edc2-416b-9399-b45ad880d52e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751701365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zrE+8OXJ3cS4paNpRcoSnhgvEgZb8sAPNGad26s/CA=;
	b=BXMSXBgmotsWcSEE8zAJIr4/lj+mEKX1tv1Q64n4dn04UONxBx4QiCjKucVR1dnqyxeMwd
	dQ0r4qejgKwc855GBoSbAVxZ/wdfcVgq50pPB7xcevQIirD5vfXX5hOOcgQio/iowhikW+
	2g8yB3PsLGUEhUE2XGzNXX656fVvpw4=
Date: Sat, 5 Jul 2025 00:42:39 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC
 virtualization
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250704153838.6575-1-apatel@ventanamicro.com>
 <20250704153838.6575-3-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250704153838.6575-3-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_004257_791974_719457D8 
X-CRM114-Status: GOOD (  24.88  )
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


On 7/4/25 8:38 AM, Anup Patel wrote:
> There is one HGEI line associated with each IMSIC VS-file on a host CPU.
> The IMSIC virtualization already keeps track of the HGEI line and the
> associated IMSIC VS-file used by each VCPU.
>
> Currently, the common AIA functions kvm_riscv_vcpu_aia_has_interrupts()
> and kvm_riscv_aia_wakeon_hgei() lookup HGEI line using an array of VCPU
> pointers before accessing HGEI[E|P] CSR which is slow. Move the HGEI[E|P]
> CSR access to IMSIC virtualization so that costly HGEI line lookup and
> potential race-conditions when updating HGEI[E|P] CSR can be avoided.

The patch looks good to me. It removes the redundant hgei lookup which 
is great.
But can you elaborate the race condition and it's effect (lost interrupt 
because of hgei is disabled during context switch) in the commit text ?

> Fixes: 3385339296d1 ("RISC-V: KVM: Use IMSIC guest files when available")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_aia.h |  4 ++-
>   arch/riscv/kvm/aia.c             | 51 +++++---------------------------
>   arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
>   arch/riscv/kvm/vcpu.c            |  2 --
>   4 files changed, 55 insertions(+), 47 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
> index 0a0f12496f00..b04ecdd1a860 100644
> --- a/arch/riscv/include/asm/kvm_aia.h
> +++ b/arch/riscv/include/asm/kvm_aia.h
> @@ -87,6 +87,9 @@ DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
>   
>   extern struct kvm_device_ops kvm_riscv_aia_device_ops;
>   
> +bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_aia_imsic_load(struct kvm_vcpu *vcpu, int cpu);
> +void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu);
>   void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu);
>   int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu);
>   
> @@ -161,7 +164,6 @@ void kvm_riscv_aia_destroy_vm(struct kvm *kvm);
>   int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
>   			     void __iomem **hgei_va, phys_addr_t *hgei_pa);
>   void kvm_riscv_aia_free_hgei(int cpu, int hgei);
> -void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable);
>   
>   void kvm_riscv_aia_enable(void);
>   void kvm_riscv_aia_disable(void);
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 19afd1f23537..dad318185660 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -30,28 +30,6 @@ unsigned int kvm_riscv_aia_nr_hgei;
>   unsigned int kvm_riscv_aia_max_ids;
>   DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
>   
> -static int aia_find_hgei(struct kvm_vcpu *owner)
> -{
> -	int i, hgei;
> -	unsigned long flags;
> -	struct aia_hgei_control *hgctrl = get_cpu_ptr(&aia_hgei);
> -
> -	raw_spin_lock_irqsave(&hgctrl->lock, flags);
> -
> -	hgei = -1;
> -	for (i = 1; i <= kvm_riscv_aia_nr_hgei; i++) {
> -		if (hgctrl->owners[i] == owner) {
> -			hgei = i;
> -			break;
> -		}
> -	}
> -
> -	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
> -
> -	put_cpu_ptr(&aia_hgei);
> -	return hgei;
> -}
> -
>   static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
>   {
>   	unsigned long hvictl;
> @@ -95,7 +73,6 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
>   
>   bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>   {
> -	int hgei;
>   	unsigned long seip;
>   
>   	if (!kvm_riscv_aia_available())
> @@ -114,11 +91,7 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>   	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
>   		return false;
>   
> -	hgei = aia_find_hgei(vcpu);
> -	if (hgei > 0)
> -		return !!(ncsr_read(CSR_HGEIP) & BIT(hgei));
> -
> -	return false;
> +	return kvm_riscv_vcpu_aia_imsic_has_interrupt(vcpu);
>   }
>   
>   void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
> @@ -164,6 +137,9 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
>   		csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
>   #endif
>   	}
> +
> +	if (kvm_riscv_aia_initialized(vcpu->kvm))
> +		kvm_riscv_vcpu_aia_imsic_load(vcpu, cpu);
>   }
>   
>   void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
> @@ -174,6 +150,9 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
>   	if (!kvm_riscv_aia_available())
>   		return;
>   
> +	if (kvm_riscv_aia_initialized(vcpu->kvm))
> +		kvm_riscv_vcpu_aia_imsic_put(vcpu);
> +
>   	if (kvm_riscv_nacl_available()) {
>   		nsh = nacl_shmem();
>   		csr->vsiselect = nacl_csr_read(nsh, CSR_VSISELECT);
> @@ -472,22 +451,6 @@ void kvm_riscv_aia_free_hgei(int cpu, int hgei)
>   	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
>   }
>   
> -void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable)
> -{
> -	int hgei;
> -
> -	if (!kvm_riscv_aia_available())
> -		return;
> -
> -	hgei = aia_find_hgei(owner);
> -	if (hgei > 0) {
> -		if (enable)
> -			csr_set(CSR_HGEIE, BIT(hgei));
> -		else
> -			csr_clear(CSR_HGEIE, BIT(hgei));
> -	}
> -}
> -
>   static irqreturn_t hgei_interrupt(int irq, void *dev_id)
>   {
>   	int i;
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index ea1a36836d9c..fda0346f0ea1 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -677,6 +677,48 @@ static void imsic_swfile_update(struct kvm_vcpu *vcpu,
>   	imsic_swfile_extirq_update(vcpu);
>   }
>   
> +bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
> +{
> +	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
> +	unsigned long flags;
> +	bool ret = false;
> +
> +	/*
> +	 * The IMSIC SW-file directly injects interrupt via hvip so
> +	 * only check for interrupt when IMSIC VS-file is being used.
> +	 */
> +
> +	read_lock_irqsave(&imsic->vsfile_lock, flags);
> +	if (imsic->vsfile_cpu > -1)
> +		ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
> +	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
> +
> +	return ret;
> +}
> +
> +void kvm_riscv_vcpu_aia_imsic_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	/*
> +	 * No need to explicitly clear HGEIE CSR bits because the
> +	 * hgei interrupt handler (aka hgei_interrupt()) will always
> +	 * clear it for us.
> +	 */
> +}
> +
> +void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
> +{
> +	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
> +	unsigned long flags;
> +
> +	if (!kvm_vcpu_is_blocking(vcpu))
> +		return;
> +
> +	read_lock_irqsave(&imsic->vsfile_lock, flags);
> +	if (imsic->vsfile_cpu > -1)
> +		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
> +	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
> +}
> +
>   void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
>   {
>   	unsigned long flags;
> @@ -781,6 +823,9 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
>   	 * producers to the new IMSIC VS-file.
>   	 */
>   
> +	/* Ensure HGEIE CSR bit is zero before using the new IMSIC VS-file */
> +	csr_clear(CSR_HGEIE, BIT(new_vsfile_hgei));
> +
>   	/* Zero-out new IMSIC VS-file */
>   	imsic_vsfile_local_clear(new_vsfile_hgei, imsic->nr_hw_eix);
>   
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index fe028b4274df..b26bf35a0a19 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -211,12 +211,10 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>   
>   void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
>   {
> -	kvm_riscv_aia_wakeon_hgei(vcpu, true);
>   }
>   
>   void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
>   {
> -	kvm_riscv_aia_wakeon_hgei(vcpu, false);
>   }
>   
>   int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
