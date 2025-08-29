Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14ACCA0FF0
	for <kvm-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vGuIAEkkP8Z8KJ8L5DZXaLKPomZ0N0tG8CUGOJEdEvM=; b=w9gWoFhvlDy32U2F4JUQBNWFBG
	Hq68QaYM9T8e81tCIneZx6JJN4ImL2E58RtrAsj/Z4hCaVHuabKk3KMTdo/TdgvDrx2QLGEJl08lQ
	0lXI2TjbhTfvrjp//KO1q3jxc663aqJ5WadLQWfCVAFP0lVHQH1b5NSq60co7YcqSCbOJTBJHvKc7
	oFB9CteCQTMBNQRr6j8iWAT6FPm1P54CsJhjEinQFh7dnszKlrmgGf5YeatUX6vbczew258XFC6/d
	sq2pfGs5bxEVQbQAhXi/ttRYdPWV4Ydr+XPHKu3l3XniskK+4IhbFiB+xhu8QXT/OwqSPLWN8UERj
	DKaSgi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oI-00000007CDf-3osQ;
	Sat, 30 Aug 2025 00:51:14 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us60N-00000006rJh-3rJW
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 20:47:29 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-327d1fea06eso1716354a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756500447; x=1757105247; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=;
        b=ZQAo+tQwf7ICQLSSaOjLPJr1Tot82AWHpWc8y1ThOXoqmwEdNqXa3T0mcEVcS9SGT3
         lSZGSwBvpqf3BnBY2k/gFO3Z4OXLXGvbFWTpshSQMitLPoi5+okd734EJ9k28wBq++Rf
         +OSfT7oQp6LT3PEJfA6I7oLyKIJgeu8LF65STy899FVn7CnEvHWybsyEHPvWQErdriCc
         rpdAWQM9o1m+o0Cn8BN8SCLjV24V/kkslU1XWizBpYf+6Sc+93q9DITAdgrRHO+9m4Mk
         yNswyVoz6kIgkrPmc85mv3K6EE3kmXBgDnFRyeTmmyF1pfAuPyGgLgspxxwY6wuAiSGz
         3IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756500447; x=1757105247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=;
        b=HlFQMk8qDdc/UBpF7yqgiRRCSrNzwBluu4xvpqWoKC+9SuopSLFTkdc+guP8T318qs
         UWq3Jgbd+rI/iqAox2RFlhipHeSc3SpZ+2wyieLk76I7tkbnmYIGyML/T8uctj+vttVZ
         KphHZcuXZ1ztWZT6L4RZoQHaePYEwABwAIkdl3rMbdhW1+0GtiD/gPIyFisn/XzWDp/j
         VWmkQY+5596LFL9ug4bBP8Lzn9DtkKFEORLBsiuLIWWUqGhUtyxM1pjO/tJTuoHlZtJh
         RyPLmIlWaqWvGjGIPL/0eCtSp236UsUSbyt0iQIVT22Zn6B90/ztoEhE9BFacDKaYivK
         PohQ==
X-Forwarded-Encrypted: i=1; AJvYcCV02uqVXMbCX9TLukfaK0QQ1xzfXszursOjCCHQEGiD0MFpAh3yvWc6xAxGAk6cRrMeGhGmzk9iSPk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtFOjE3aKBwVQPaly5yE0270BsMu6LQElCrh8r/BCNK9rDaCN3
	+gjH3zYf/eWr1ZqveHbJTTDeBVqzq2lj9tV1QQ9/G+xGrqTqWe4oWMxsvYNW75+wuT5AGfEBL4f
	Hi6gwiQ==
X-Google-Smtp-Source: AGHT+IEEqHXHhC1dOfepFQ4McJBotwArzkUulxIcLhYJ/fKtpfgV5WqeosCA+M558p3CNkr7r/wGr0do/qg=
X-Received: from pjbli2.prod.google.com ([2002:a17:90b:48c2:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3889:b0:327:b30d:9b7f
 with SMTP id 98e67ed59e1d1-327b30d9cdbmr12852743a91.12.1756500446915; Fri, 29
 Aug 2025 13:47:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 13:47:25 -0700
In-Reply-To: <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
Mime-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com> <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
Message-ID: <aLIR3deQPxVI2VrE@google.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_134727_960082_F8BF749C 
X-CRM114-Status: GOOD (  22.31  )
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

On Fri, Aug 29, 2025, Atish Patra wrote:
> The arch specific code may need to know if a particular gpa is valid and
> writable for the shared memory between the host and the guest. Currently,
> there are few places where it is used in RISC-V implementation. Given the
> nature of the function it may be used for other architectures.
> Hence, a common helper function is added.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/linux/kvm_host.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 15656b7fba6c..eec5cbbcb4b3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
>  	return !kvm_is_error_hva(hva);
>  }
>  
> +static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
> +{
> +	bool writable;
> +	unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
> +
> +	return !kvm_is_error_hva(hva) && writable;

I don't hate this API, but I don't love it either.  Because knowing that the
_memslot_ is writable doesn't mean all that much.  E.g. in this usage:

	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
	if (kvm_is_error_hva(hva) || !writable)
		return SBI_ERR_INVALID_ADDRESS;

	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
	if (ret)
		return SBI_ERR_FAILURE;

the error code returned to the guest will be different if the memslot is read-only
versus if the VMA is read-only (or not even mapped!).  Unless every read-only
memslot is explicitly communicated as such to the guest, I don't see how the guest
can *know* that a memslot is read-only, so returning INVALID_ADDRESS in that case
but not when the underlying VMA isn't writable seems odd.

It's also entirely possible the memslot could be replaced with a read-only memslot
after the check, or vice versa, i.e. become writable after being rejected.  Is it
*really* a problem to return FAILURE if the guest attempts to setup steal-time in
a read-only memslot?  I.e. why not do this and call it good?

	if (!kvm_is_gpa_in_memslot(vcpu->kvm, shmem >> PAGE_SHIFT))
		return SBI_ERR_INVALID_ADDRESS;

	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
	if (ret)
		return SBI_ERR_FAILURE;

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
