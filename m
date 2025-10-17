Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8596BCCD183
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFmQOzSytm2HLTcpQeNsyk4+7qriV3LfUJlDR3EtLoU=; b=JbbXYVP6+tyv/Z
	siCPlJ5PXVOMxB4hrxVpm/FS1nMg2q4LXsxZcY3ww70MS1crt3oMtKvHT4+/gnaasqRcaO/pAyJv7
	V4rt0b19Y6O4WM30WezKBMnXLHXLwkNFpX+t74U8/9fp2nQpy+2b2YaFGCg9QVM3ujycRKcCEgd/Z
	e/27IGB0mmAcO7WoGc1oFx4dvW8o6r0UtkOAsdhYDsVBXkdv+g0q5uPh40fY+fRImzrvqvJy+xmCJ
	JFk/zpJNLD1H454E7C7/xjtUEL+AQzLUJyHCWdPlrEy7HUDJWwqoLCOd0fVb7mpWFzcNv/W71Kx/O
	RrykyuXLJuud7l86y3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YR3-00000006G6R-0z5t;
	Fri, 17 Oct 2025 00:35:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPx-00000006E4M-3wJc
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=; b=Zi61iTVw/GMCc3M/HmaEFxcies
	lATpAtpXQV9L5IY9YJlWJcokZvVxhxXiVYMEaJ5rqT6Mw7hYwbi7xK2LRDCh5/wjwRNpzfEJQ3ewZ
	nqsVCjlG0Dbii8OZQ0dqjGpnUW+n5UJPp45uwFbzbP2b01RUGCERoX9U+c8lNjv1jd0+M89W1s2TU
	WdrZAT3f/cQoGxZ9WECaGnWnP0qHN0h+GZLFyQI/xpewkp576JtGHIu22aWTAAMbT/d4F2tqHMDhH
	RHWSh7I4kXRCmiStqWtAjhNBaikuz0cohgdHJSbIltvYMTwai+CXjMEh1VlcercRiZHvLJD3CbQTO
	QjnS5IHw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPA-000000078HW-1vmD
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:53 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-334b0876195so1510815a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661188; x=1761265988; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=r9maMDmJcUPDZnSH0yeF1sTspO1Ld+K/mjAZSC4NKityJ+wxtf29m1QV53lYFOe4zp
         RfhMygkXV65IIUOipNUM+lscmKdIEE5UKyIjcfZP639EJ5SbMOeYW0IsfwUEPBuKNwoj
         6oeC+ZOkGiuJvUZGNiIrcg4AqHQ2V3LxxBNXBYt5InCewi5ff7Kp+BH2JWXLCvtYE6cT
         TFHqIWoHHtqbOET89EKz/eAGffeMNl08+8HENSDYz7hZyYqbtGrYsG9Cz6TTjVzuxYQR
         zXKRb8d1KmFbx+rrkPSPUqEOnvTVTmne7Ozs7QcO2UxR/0Bg7MAosAft+cnnPDUw9tfN
         pnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661188; x=1761265988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=RkdlXPCC8UKh12nFygtweSB4oxZRVLJBNAYz6JuZ3x+Q1ztW8yQ7i7ctxaADjpotFI
         dL6B4SpZSea9Xjn8wvTGRTIE5MNdQO5D9loUUDZYjSWoI0dRvts/jBOfWdtucWTzCQAB
         B853r8YS7p9OAsLBsmJDhXGPNoyFKCuzbVGdiThMzt+2dep+d3XnB0F6Lql2ixGlThFX
         j1aiO0PAjKrBw/QeYeH8ska1T9CMgxbcyR4q1CYJHQKwUPRTohtPGre72H+wroGk5Tyh
         i009gh24RtMOTOuglbON//od9oB6wbUdeThnjCx+xHcBL/SvWOSI4P+gilrEhby7m6Di
         VFbw==
X-Forwarded-Encrypted: i=1; AJvYcCXZkWcNZQ5pfrwJVuDK8h+SiAQqXtVBFF8fCk0/jS9G79v1nvLyYdBsqB7ZL4CHoxlLEhzKiHAcPE4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzEhdLZtdP44WdoYD4bO87bkqipa8J/OVfSArK4Gq584LlKND9
	C02eDBqDtqw+I0f3Vp67TxK9UcOIr2Ge8bOmvfrAdmO/2EYWUKDLhlFH209+bpCr00VM/IpTu2e
	AEKZJRw==
X-Google-Smtp-Source: AGHT+IFv5wQBYU08VlWSJ3YEyBvWx6CUl5P/6vzeOVA3OyqdlNjTdwYkeUoBdZlGjRBJoj7p6GD6I+E30lo=
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:33b:caf7:2442])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8c:b0:32b:a2b9:b200
 with SMTP id 98e67ed59e1d1-33bcf87ab38mr1930441a91.13.1760661187797; Thu, 16
 Oct 2025 17:33:07 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:29 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-12-seanjc@google.com>
Subject: [PATCH v3 11/25] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013326_022661_F684EACD 
X-CRM114-Status: UNSURE (   9.94  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f5cbcbf4e663..220989a1e085 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1721,8 +1721,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
