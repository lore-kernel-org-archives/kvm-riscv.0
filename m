Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7962FC83F27
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FukRrH1B8sIJgnz82OVQQ0lmnpGs2kAciw5TNniAGBE=; b=gkn08EBylLeBCiuuW561TZrql/
	jlIioU+nQcSWpf40BtuLEUSQL5BmqVVg/mg4xhWfLvV/s/oeSlf2msFvPI5rD2Dp0y2811d9tjH7G
	c2lovHrBrYt6nxskaLwwhOhVIzNgsamjWUJiqWVjdN8bzpJ2uBz+gq1aYHDVFZOMVjv2eqEcVo49V
	AE/IC+xJ+f/gPuZwvrz8eh4m2pjVBHbE+Jw49RhgRptYHQ4RrdFrAXw8BE/j19ebuhd3kDgvqNuAW
	nEYwq8/w0YGkHAt13LnT8373I+t1BpH5NofRPecgbfwH0oQzZJ+6gMc2t0rNxLDQSXs32fIOdH9yx
	+dot/+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGfF-000000037hH-0o3h;
	Tue, 22 Jul 2025 17:20:29 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGfC-000000037g4-2lvf
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:20:27 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23824a9bc29so91087515ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753204825; x=1753809625; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxAdZVy5bnkl4KqmKmn73hf8YAbhvCFGtW8F9Kd55hQ=;
        b=JvpO2IXpxEJwkPtwujauH7AZmLJVP9zvfrXTFESKBE3Sf35FApwbdhVSIiso3m9psC
         uQMZrAT9dx9700uO9gZ07RJpYRCaFlphVUYUrl/DJr2X7o0ESvYvGXsluXmcggSYiVhC
         u/CDiTiTiZu9XarbrYKn1/Gae1r0/gUM+UQQoZCA/DSO5GgYRMOuYptGZGYrgX//ixmh
         ghHvA5LzewpEZKfgOqwU0ed3/j2IluWKlPksTR5wNeENpVHVUoIvR3H4BKeG2SiQqtGx
         oxEY6bfPbgcrQh4A7piOXQibHZSSjm0mShb3yTg0B57nkZZlxtD5rTG5YeSM4zkA9NcE
         OB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753204825; x=1753809625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxAdZVy5bnkl4KqmKmn73hf8YAbhvCFGtW8F9Kd55hQ=;
        b=wliDoo/Szr5a1fQ71hDe86uwd3j8uaNL3/4cW0Wp9AF+CvOnI9QG2fUNw4NfpjXnJM
         eGjLi4nVbJCaEl2DdM9EiOB++46LY7eNjiX05cLklFuSihknkyX3+GtN8w2Yro5kChpj
         4VNXbo/4XzMfH6zgAFPXDd/Um5iXO6aZ+TkI8VvZe1BkZBZsy9wdpbGpwAhDhLa09bpT
         7vOAmfjN2frCMrLDEJRSj/5RY6cc3fgoXrXXxAZWKbIplqjzuA/Cm6E0Z4/oUXPKrUAR
         ZJro8R9GIcImgOyWrjqIFqrqBgVInPUYstAbxndJ4MBOGZ2v3Hx/BgB5izI8kWFAAp/5
         hYFg==
X-Forwarded-Encrypted: i=1; AJvYcCUmf4CCK1DovTLN0AY8tHFHR8ZMfNalSLTvKp4JdCueCLj/EyxkjRU6/lt2jJtfFQwj6uuu3k5SHRo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdBAqd0rqK5gvZEcFzAp+cxC4t/AzUE4cFlVNYr8gZ3sX8NiAX
	I6dGdavyzgEReLQt1ZFra5JawS9gGMYoWgk7qiUyyff3D3N3VJuOVk07f7l1Ou7+ukMetbXKzpc
	8ohyfvg==
X-Google-Smtp-Source: AGHT+IFPwqe8zheAvHey8s0KE1DDyf7guFt8iRaY4PC5Rd3QBhN41iFPFY93hbtWc17LP1SCCWCPuinQiL0=
X-Received: from pjbnt20.prod.google.com ([2002:a17:90b:2494:b0:31e:40d4:1d0e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2342:b0:235:ea29:28e9
 with SMTP id d9443c01a7336-23e25764c41mr424140005ad.38.1753204825492; Tue, 22
 Jul 2025 10:20:25 -0700 (PDT)
Date: Tue, 22 Jul 2025 10:20:24 -0700
In-Reply-To: <20250721-pmu_event_info-v4-6-ac76758a4269@rivosinc.com>
Mime-Version: 1.0
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com> <20250721-pmu_event_info-v4-6-ac76758a4269@rivosinc.com>
Message-ID: <aH_IWJUFVODUGuva@google.com>
Subject: Re: [PATCH v4 6/9] KVM: Add a helper function to validate vcpu gpa range
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_102026_697317_41AA5303 
X-CRM114-Status: GOOD (  13.89  )
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

On Mon, Jul 21, 2025, Atish Patra wrote:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3bde4fb5c6aa..9532da14b451 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1387,6 +1387,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
>  
>  unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
>  unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
> +int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
> +				bool write_access);
>  int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
>  			     int len);
>  int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 222f0e894a0c..11bb5c24ed0d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3361,6 +3361,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
>  }
>  EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
>  
> +int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
> +				bool write_access)

Please no.  "validate" is way too ambiguous, the result is inherently unstable,
I don't want to add vCPU-scoped APIs (too much x86-centric baggage), taking an
arbitrary range without a user adds complexity for no benefit, and this is basically
the same as kvm_is_gpa_in_memslot(), but with write requirements.

I would much prefer to add a simpler helper to complement kvm_is_gpa_in_memslot(),
that makes it as obvious as possible exactly what is being "validated", e.g.

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..29be907d28b0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1915,6 +1915,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
        return !kvm_is_error_hva(hva);
 }
 
+static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
+{
+       bool writable;
+       unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
+
+       return !kvm_is_error_hva(hva) && writable;
+}
+
 static inline void kvm_gpc_mark_dirty_in_slot(struct gfn_to_pfn_cache *gpc)
 {
        lockdep_assert_held(&gpc->lock);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
