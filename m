Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EFBCD37B2
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8wJ3fvSciMyvfugPIDyG1vkOdZP537cdR5b2SDyGlE=; b=F+PMhOoSa4uA/H
	S/fL/k7I1v7hzlVqA3YgQ9GFVjyPDHbZ7Jws78DJITZOuYiZw88ZqrEOgevbm76eosCuyEI9bflKT
	8Gl6Bh6bMHt5l7I6Ky0yHgmIGilc7WuEg4mhUiZhizJZTfcALebVM8N/ewgEROt0HHG/l0CEfpZBH
	M1aycvjHULI9KncAN8f2ajSAufSuEQ5wUg2G738qI2X4qdTB0ftZ+2+H1WjQyEVoOQjxBFDYku3Wk
	8vVNJxyN6JuwRIzcWVC3LAfCwKPHreel6aMiXbY2hMgbp0UH8OuEUEGA8HT7UTo0zUix5etRFDWrE
	hBFrmc7WFXoPDmqaf0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGj7-00000009QYd-2ZvX;
	Wed, 12 Nov 2025 19:41:57 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGj5-00000009QXu-0Z8q
	for kvm-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 19:41:56 +0000
Received: by mail-io1-xd43.google.com with SMTP id ca18e2360f4ac-94895f6b144so4639939f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 12 Nov 2025 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762976513; x=1763581313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMA7umxa7M13/2nnsYuaSzmg/6tAsRTTmHWEbgAOFwA=;
        b=TF/aCnE6IZFUHZwX8ne8HLvEIUgtVZJbPGaZyDX36j91cU9M7shFxxb08cEUKD4NMW
         4cOnMuuvq42QHNu8tYc6zlmOLVmwkF+mEmoI1nQLrwdylFNAS/8oFPX24AbXC09iU9xD
         v01QHOxdL6Ji2CoUamcq4P0Zjnx6h7NTDgJh3kPBUwOI7cyfS4ENCxP8g0bGRyYJFB2c
         DRFl2lFUrhUwMHwE5GeBt1poe//lGJ9Vja38OMnuhjEO7YyTZwUlqMcrZTWHEolMud4u
         NbxtVtncFPMq1ZNsXpq3EQu0nKaDElYH24f7PYJqtEZ+/uEls9AqLHYW4QVlPNRPLSl7
         WIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976513; x=1763581313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMA7umxa7M13/2nnsYuaSzmg/6tAsRTTmHWEbgAOFwA=;
        b=oysvT/5x2SSwq8XEtDhUDKVVLbyvyljRz6kRvjDRZlElPuUNtqNysA6eXCXy9sXPPj
         Or85/FxWfjSWozMdydV082Yzwrmuc23yj3MUEY/UlsSnfWxSqaL1BiIqzKSIbioDe2nV
         7YohGqBnOb/0WBfpvHlpGq31C3Pm5xFS+9cTIW6kla5JiToLYZsgDxZclPENNPqP60iI
         dM6CxAiOid/HC4+WdLzI/7u3Il2+TO0xVAAEuTv5vi8Ct8gMR6SM+HzEQv5f4K7kHMG8
         SOe4l8aWZnJ3Ur1Z0/jbp5L39St8k+eVnty1/PR+z+RsdWnIDuq9JWoBuhgCqdkiMVFj
         eIcg==
X-Forwarded-Encrypted: i=1; AJvYcCUEHNrRToXMg8oXMFRPztCGv5Dk2vqnvEgcXnL9j+wkS6G+phTCwUyfDymmV8fsJgHm9Psw+EvxMCI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiclAjPquwSodtOmn0dbLMSoTiCbCpBIZvpQ43oSd3oKCRNw52
	ldo8auVuAiXcvEz7Q6E0UqUgwI9Xj9LxaD7bmvTZCtTMIXq1WtIpPVWg/x9EYPUlERE=
X-Gm-Gg: ASbGncvkfcCxv6VkGsjQZkMJsOY0FzHvjunt+qvQA1OEvwrPVld1ozLkj3jwzX+xCrV
	mzDELIvVwP3xJzZvH46wfQXdcMJC+IFeFAX2dXuOkEFF3YOrtQ6Vo6zuQngoI0gkKhXAG7f89f1
	H+KFhxfoP8vlWK+NokN5ufJ8n2IKIjjtPxU/ughQwGyuaw1u27jVnRNnqJ+kQeWCUOJRxYFbOW/
	GVhlilbODsch51GqezIN3Tb2O2VmW/Nqc04yMKKErS0XmUNB2/zuQpwKYCPU5TcGRsHW1y+9LOP
	qV4oJrJuYQi/TSGs7UFiN9s7LEDa1ap0OvUO7z3YDFh9g8phX2b/ZpYMxGDK+grqsiLaYJsVFOh
	+FqbmTPm88F62Vpls64oFTEh5pE6DIKmDunSXVXbPENoViaWGzK+Ku0ojNO5Ce6ToVVqxp4nq6x
	lr77W2xYnSg3qI
X-Google-Smtp-Source: AGHT+IGh8DCFt1oIqqCbGQ0wsRQiBXjDUEe509PqSzAj7qQEM67Tz6IzQ/QYjRBR31SonG3aigsETg==
X-Received: by 2002:a05:6e02:1561:b0:431:d7da:ee29 with SMTP id e9e14a558f8ab-43473da5e33mr49322955ab.28.1762976513477;
        Wed, 12 Nov 2025 11:41:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7aaf78752sm1340522173.15.2025.11.12.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:41:52 -0800 (PST)
Date: Wed, 12 Nov 2025 13:41:51 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Fix guest page fault within HLV*
 instructions
Message-ID: <20251112-ae882e7fd8d1fcbb73d87c6c@orel>
References: <20251111135506.8526-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251111135506.8526-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_114155_209827_A8C89907 
X-CRM114-Status: GOOD (  22.20  )
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

On Tue, Nov 11, 2025 at 09:55:06PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When executing HLV* instructions at the HS mode, a guest page fault
> may occur when a g-stage page table migration between triggering the
> virtual instruction exception and executing the HLV* instruction.
> 
> This may be a corner case, and one simpler way to handle this is to
> re-execute the instruction where the virtual  instruction exception
> occurred, and the guest page fault will be automatically handled.
> 
> Fixes: b91f0e4cb8a3 ("RISC-V: KVM: Factor-out instruction emulation into separate sources")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> ---
> Changes in v2:
> - Remove unnecessary modifications and add comments(suggested by Anup)
> - Update Fixes tag
> - Link to v1: https://lore.kernel.org/linux-riscv/20250912134332.22053-1-fangyu.yu@linux.alibaba.com/
> ---
>  arch/riscv/kvm/vcpu_insn.c | 39 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index de1f96ea6225..a8d796ef2822 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -323,6 +323,19 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  							  ct->sepc,
>  							  &utrap);
>  			if (utrap.scause) {
> +				/**
> +				 * If a g-stage page fault occurs, the direct approach
> +				 * is to let the g-stage page fault handler handle it
> +				 * naturally, however, calling the g-stage page fault
> +				 * handler here seems rather strange.
> +				 * Considering this is an corner case, we can directly
> +				 * return to the guest and re-execute the same PC, this
> +				 * will trigger a g-stage page fault again and then the
> +				 * regular g-stage page fault handler will populate
> +				 * g-stage page table.
> +				 */
> +				if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
> +					return 1;
>  				utrap.sepc = ct->sepc;
>  				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>  				return 1;
> @@ -378,6 +391,19 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>  						  &utrap);
>  		if (utrap.scause) {
> +			/**
> +			 * If a g-stage page fault occurs, the direct approach
> +			 * is to let the g-stage page fault handler handle it
> +			 * naturally, however, calling the g-stage page fault
> +			 * handler here seems rather strange.
> +			 * Considering this is an corner case, we can directly
> +			 * return to the guest and re-execute the same PC, this
> +			 * will trigger a g-stage page fault again and then the
> +			 * regular g-stage page fault handler will populate
> +			 * g-stage page table.
> +			 */
> +			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
> +				return 1;
>  			/* Redirect trap if we failed to read instruction */
>  			utrap.sepc = ct->sepc;
>  			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> @@ -504,6 +530,19 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>  						  &utrap);
>  		if (utrap.scause) {
> +			/**
> +			 * If a g-stage page fault occurs, the direct approach
> +			 * is to let the g-stage page fault handler handle it
> +			 * naturally, however, calling the g-stage page fault
> +			 * handler here seems rather strange.
> +			 * Considering this is an corner case, we can directly
> +			 * return to the guest and re-execute the same PC, this
> +			 * will trigger a g-stage page fault again and then the
> +			 * regular g-stage page fault handler will populate
> +			 * g-stage page table.
> +			 */
> +			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
> +				return 1;
>  			/* Redirect trap if we failed to read instruction */
>  			utrap.sepc = ct->sepc;
>  			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> -- 
> 2.50.1
>

To avoid repeating the same paragraph three times I would create a
helper function, kvm_riscv_check_load_guest_page_fault(), with the
paragraph placed in that function along with the utrap.scause
exception type check.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
