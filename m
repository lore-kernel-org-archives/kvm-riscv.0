Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D974E7717D
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K9z8bQhqfA0YVDYgN3yyqAiOvLJISeVhnwLo4o8rd3c=; b=im3wiViQ7JiVjXbKqYE+l/rNaE
	gG7ruH9u6wTqpOK/b2SehEEivI7f9SfGEa6BEc8dMjy+fcHPasTAJCVWsHJhBx4rvIJztgdHbTN+8
	zoVlZ62SYVXGr9x5D0sDBggcRYg2oa8FJoG8wL1wzX8N/xtsbskormrKzmTiuVfsVqQAyHrhKwx/T
	n03wgP1d9n81bDRRXOaXsImreD307qBCOJx4nngQbYExG45N0JsPFtRuIpw56bXyng1U88tzgYJKn
	wkRn60A8rNVvxAJ3hby60wxSaGT9FtcFxAAq66A8eIvx2YjxiFKqp4x8ZZeLUqUSfbW8uEq+OqVpM
	+MT4olbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUqY-0000000GGpD-1NjT;
	Wed, 11 Dec 2024 22:06:18 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUqW-0000000GGog-1kro
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:06:17 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2161d185f04so41513255ad.3
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Dec 2024 14:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733954774; x=1734559574; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uTDUEy5ndzyMUOmAANu+2Q5dKv5CytQeXy0bYdZM4AE=;
        b=M3Bru2PMItz8Wrb0HTDjhRXHVYAn3fdohKpOzG7w6AaYNo8fNyFcmvkZGEO9dflZN0
         5rXU4ersi/gkulxG9ojafWKJ5TWnlJxeF4kTTfnM4ZKgeObq+0o/V/zPP8SWW3LXnEhy
         fSx6ttdiRPvl0fAvFzrsr0Ww4jusgtLdVf5+Y7E9q/QAnEHi3Xb93TFK0RoHdsw/Zr+k
         uy6urti6vHUpPafFA14slgvqUxe5TNvhqu9lIJ+9wIROU3no7MSLlLm/1LcD58/R3dsC
         KpXSKClOQQGFAcGhR+NPX3kjGWSo4+kE/t0C9j1o2zIxFgWu/UBeT7FJGXY6QL9dOXtm
         8bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954774; x=1734559574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTDUEy5ndzyMUOmAANu+2Q5dKv5CytQeXy0bYdZM4AE=;
        b=AI8eL3adxLQgqBRF7CSQrWTAZAdrc8MFcVz4Yqd6BuyJUGS+T3K2XWfHsPN+lFfUOx
         Hslelijp0pMMmegYtcXiJmh9+7GEipQsuqOshB6YUtRQFKKyJxYi6CbZ0QKnIGN2+gy0
         PBf5M2zZdqC/3VM0EgUwCOq96AmHkytmATcq1RbOY1hiTAhkXzHBna3WhQJD05WnSrug
         adNtUwzD5NP9MbIoFRDzXTxU1AvIRcwJaoVnrO8jcDK5eB51gP2u+jPMYtpCYbqFi61d
         qMvX/nKSIl6vk7kVGRxnVPiy5qUCSFm+uo1RydS/XAn1Rd4OnBe/9qUyC+V7Vb1BOaS7
         Hkug==
X-Forwarded-Encrypted: i=1; AJvYcCWNaZKgC4WOCzjA8Hz2Osz99AZn94z7RiD41gqtSv6FBn15JmWecroQcxUsXGBrzjgKqqrJpXY/jLc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjpqprCKNNEJmR9b05XcSOJuBD49+A0T6ND60SUdAe7onCmopd
	+jL7VcB19vWruZAM56FlwT7y9KLVtderx4J/HNLFWNpV2DVwX7Zv3cB2U/Vyaczc8KcRiEvj94r
	T3w==
X-Google-Smtp-Source: AGHT+IHFSnyjPEDTcWJnAvaiGma2JfY/srzHSvKplMJ9OueXQOEiKTtjMmaF+b36NOyPghd7X0ZdCPZjbkA=
X-Received: from plgn1.prod.google.com ([2002:a17:902:f601:b0:216:499e:dadb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db04:b0:215:44fe:163e
 with SMTP id d9443c01a7336-21778397514mr77377935ad.1.1733954774653; Wed, 11
 Dec 2024 14:06:14 -0800 (PST)
Date: Wed, 11 Dec 2024 14:06:12 -0800
In-Reply-To: <20240910152207.38974-15-nikwip@amazon.de>
Mime-Version: 1.0
References: <20240910152207.38974-1-nikwip@amazon.de> <20240910152207.38974-15-nikwip@amazon.de>
Message-ID: <Z1oM1HQqXrIr1tij@google.com>
Subject: Re: [PATCH 14/15] KVM: x86: Implement KVM_TRANSLATE2
From: Sean Christopherson <seanjc@google.com>
To: Nikolas Wipper <nikwip@amazon.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Nicolas Saenz Julienne <nsaenz@amazon.com>, Alexander Graf <graf@amazon.de>, James Gowans <jgowans@amazon.com>, 
	nh-open-source@amazon.com, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_140616_453482_0653E9BD 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 10, 2024, Nikolas Wipper wrote:
> +int kvm_arch_vcpu_ioctl_translate2(struct kvm_vcpu *vcpu,
> +				    struct kvm_translation2 *tr)
> +{
> +	int idx, set_bit_mode = 0, access = 0;
> +	struct x86_exception exception = { };
> +	gva_t vaddr = tr->linear_address;
> +	u16 status = 0;
> +	gpa_t gpa;
> +
> +	if (tr->flags & KVM_TRANSLATE_FLAGS_SET_ACCESSED)
> +		set_bit_mode |= PWALK_SET_ACCESSED;
> +	if (tr->flags & KVM_TRANSLATE_FLAGS_SET_DIRTY)
> +		set_bit_mode |= PWALK_SET_DIRTY;
> +	if (tr->flags & KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED)
> +		set_bit_mode |= PWALK_FORCE_SET_ACCESSED;
> +
> +	if (tr->access & KVM_TRANSLATE_ACCESS_WRITE)
> +		access |= PFERR_WRITE_MASK;
> +	if (tr->access & KVM_TRANSLATE_ACCESS_USER)
> +		access |= PFERR_USER_MASK;
> +	if (tr->access & KVM_TRANSLATE_ACCESS_EXEC)
> +		access |= PFERR_FETCH_MASK;

WRITE and FETCH accesses need to be mutually exclusive.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
