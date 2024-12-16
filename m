Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC7AE7717F
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKYZ3twjaxmOnK52J1KIuCD7rHiCekjDTueU3xr/GVg=; b=rGiUmLXSUW2OUf
	3biCIkNXSSPOW2CxNAdG9mvHGSg+3Oe+MJ2lD52kyNDzhC2ms+H+/bjePOQG2bXP9ARgJJiyouxsH
	t/nSmAzOLXyvQ/AyDUFfi49IGEmLMBxfFn7he2v/FVm2cahYRral9CrboR7HVCFVHQdMpmSmNjE/b
	YZxrLYBWamsJ9jbMonEWnVwEI86XmiAYRTG7fpPHLno8l2KE+3xuCb2KNFvLyUCKqioQzQF9tPNSP
	2AoZEy9vRFA3+BmP8MqbPU0hjF4njo5AkC4B3rYqCBi/qJ4AjSsfJ7mlK2Ee2Hm93Ev6g4clcLUEe
	el+a9iBH8Az1aMFDD+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJff-0000000BZt5-3jkQ;
	Mon, 16 Dec 2024 22:34:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJea-0000000BZfO-1rZ9
	for kvm-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 22:33:30 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2eedd15c29eso4065637a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 16 Dec 2024 14:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734388406; x=1734993206; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9jJCzoGzQp+cdjga58qGUwc3ffJR9vhNALvR1f7QLKI=;
        b=Lj1bwB5qFVVYl6V4ofAH8DiHbhJjjKmkd3/tXkieDtcGyUbOMHSxnxQMOwHb4O1/W4
         /UH0jEg1mw1+1hpFXy4DBXhPydOlgQAPBpRZFJcygvFeDvSghE0iN0pyqG63OCXY2ld9
         KJ1vyMAoV8RWXL8+yjb1cUYJauX5BogoDlKlv0U2dZnplaXnOJn9mH5u/jjIPhYAVBOX
         wjs50RokXxtn02ZRKT0tEWoxipntZIxoO1lmzYFNWcZuyXOJdAEfl0vEaj88jGsEOx4V
         AWXKCAf5uEJerylMYLtfkPYv1cnygP9Opf+BUR1gpfTdS4w6tOKVPeTWRpAt/RSLnaWv
         gCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388406; x=1734993206;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jJCzoGzQp+cdjga58qGUwc3ffJR9vhNALvR1f7QLKI=;
        b=SetbJL+800vvNX95Am9REo7XjOomJqXpsv5xpGTqpmdyhHRVgB0i3qeDJrVJ136ILC
         WgcH+LOWY8NKGhTUsObVY3JgIHFLOmAxoSDVsG7+hDETVuTKOtrJYNdJqfPjaja4x/I+
         pweCIKvURdpNt5E3ADyRPD4uiB+tpswpt3fYwccwOQMH1IOe4B7EzPpn0J0xvyJa1FA5
         Cv1/jnsJQtNHbsKDP01FqJkhL8328b9cdbK+UUnIBbAtlPgfhbVBdyhfcebppNm7uuLD
         euaUA7JURSY1pCE9b4U40WTRIUvwxCu+UXVZ5isRrkUcoNTeeg9cMT4bP4JjugUIXfSF
         PSJw==
X-Forwarded-Encrypted: i=1; AJvYcCVQNVhoH7JHhIUcBAxGSYL3BGwow0fUT3FPWix+mdFx0AjhIfSve3FHTNZc9TCCEZmocYIKN6AiLJQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZd+fLgNO6jFqnpDDwtztIgE7RsVxrh2z3ndG3bJtkmxq1l5UI
	L+nqG5S2SMJkrXXiEioIGkyucTmi53M319MjP7ivGCapqkLemb7GJe9R8npFujEbxrVyaHg1HXN
	auA==
X-Google-Smtp-Source: AGHT+IHhtWHdid0XDbI59B1aoA+CN7rFIH/zmVAk3APPQqAwY7oJZB6TaL0aH/5JThWes+dWQrGdtB7EGl0=
X-Received: from pjd5.prod.google.com ([2002:a17:90b:54c5:b0:2ef:8eb8:e4eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c887:b0:2ee:6e22:bfd0
 with SMTP id 98e67ed59e1d1-2f2d7eece80mr1530327a91.21.1734388406334; Mon, 16
 Dec 2024 14:33:26 -0800 (PST)
Date: Mon, 16 Dec 2024 14:33:24 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
Message-ID: <Z2CqtL1R0-368hO-@google.com>
Subject: Re: [PATCH v4 00/16] KVM: selftests: "tree" wide overhauls
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_143328_473872_BA7E114F 
X-CRM114-Status: GOOD (  15.23  )
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

On Wed, Nov 27, 2024, Sean Christopherson wrote:
> Two separate series (mmu_stress_test[1] and $ARCH[2]), posted as one to
> avoid unpleasant conflicts, and because I hope to land both in kvm/next
> shortly after 6.12-rc1 since they impact all of KVM selftests.
> 
> mmu_stress_test
> ---------------
> Convert the max_guest_memory_test into a more generic mmu_stress_test.
> The basic gist of the "conversion" is to have the test do mprotect() on
> guest memory while vCPUs are accessing said memory, e.g. to verify KVM
> and mmu_notifiers are working as intended.
> 
> The original plan was that patch 3 would be a single patch, but things
> snowballed in order to rework vcpu_get_reg() to return a value instead
> of using an out-param.  Having to define a variable just to bump the
> program counter on arm64 annoyed me.
> 
> $ARCH
> -----
> Play nice with treewrite builds of unsupported architectures, e.g. arm
> (32-bit), as KVM selftests' Makefile doesn't do anything to ensure the
> target architecture is actually one KVM selftests supports.
> 
> The last two patches are opportunistic changes (since the above Makefile
> change will generate conflicts everywhere) to switch to using $(ARCH)
> instead of the target triple for arch specific directories, e.g. arm64
> instead of aarch64, mainly so as not to be different from the rest of
> the kernel.

Paolo,

Unless you or someone else have concerns, can you apply this to kvm/next sooner
than later?  I'd like to start applying selftests changes for 6.14 and don't want
generate conflicts, and I really don't want to have to rebase and push this series
out again.

Thanks!

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
