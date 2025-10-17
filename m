Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BF6CCD19A
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMEnNLj0M1HEHoTdlRo9vvEdXFuGDYq9ofNP37Wqk4M=; b=4Bk32VboMgNsp7
	jE5k1mtOjOCC4mcQSXM2ytQqx+VtC5+8q3WuFuGDzQPUAhZbah59VSOZHzu6r7/+hHpw4LsD0xFa/
	4LfhB4YPBaHUListdfQclltf66xRt04atfVbIUylyabLiEz3ZjdRFO87u4kVu3ZZeTNwIGUf62k0S
	sP/KeGCDlro739esgxuNqxCSC4m/kRTuGAFAAqBeYfiweKvyZ5giRJ+YciRJFhiK9PcJKRT3Uc52V
	Ez0O9vB1M+LPejAyCNKY0ysmCLXZ2U2XE6ceTBGfVAeLWrh25Pt22a8k/Q66TTdqnZ7OpYTPLLPdI
	Lw4HLeVE3MAKwZypSepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YR2-00000006G4F-01S1;
	Fri, 17 Oct 2025 00:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPw-00000006E2H-2Olq
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=; b=QnZPlcSg8ZsUpKhtLLmaJ2yze+
	xN23u9Bzopzq1HqqH0UX9VwWCUhYWUGPDUjQ1/5v0Z0nZBzGUg/WaREvaNRc2OkFHcuFu32Ou0fka
	X+8K7ZRQPDyzDL4tMBCUYGjeLRjwOXPxuQOh8bV3dspACLq0Fuwiu4otdHtquMSpK3i7LFchPuiHq
	gJ550gpxaOWUhcJgPTOZ8O3dutf5dvvqI6OLJ/v8Q9kC/4pwppTbNKRdQohWuC9bMSS6237+bPSKj
	PWGID0a/Vrkv52hR1h3b2aZu3IArdDyd5wVf2YIXWYu/2AB/PYI9/02G5MZIKQbrKznKLZdeirGBo
	9ETjvLTA==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPA-000000078HY-2Cux
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:52 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6097ca315bso2101627a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661189; x=1761265989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=HttfWQmFgE9GuQnXOq3SdSpoyNL6bG83qZvQZmrwjjE9yOF8l5YiGpFIxR/KDgbBp6
         HPuTHb5K3PWax0Thxq42unCBEoGx6+01FgV+6dImjdxJpZrtBl5Uf3L9mWx2ee1QSxTP
         yppR0X2wqRK1Kx5bnjFaL16ejHt+JBQQdWrwMuJISoafJPaDdlOlnx5Y5srsOv6Ms8Me
         +mGtgtaI9U3VtRWzWQoCv0HiNY/l/m43S3kv0EPaaiYImSltrh5wxRduSj5K20yoaNaO
         7kv3G8prTHAaDvGF7DQ8Wtwua59lnrcjRPkW9mH8Eo6D6maTo3eU9eaDA7SnNgEoO4sO
         mM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661189; x=1761265989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=mbTaK9nI2qq7dOPeI0wSTMb/i6TjyiUU7E9a8HHpBmM6CQwn2avxk+sB66K0Yy4PeO
         VHJgz1m58fhINyF+XxPBNST8JYyFjVoJXfYWmQzZAH3FXC2qmcn2LgxH/SxdsMzc16GQ
         ncq+jaaPJie+Jn/ADEEac5z3xLX1PK1J9EIGCze3bCw+iZ/w5dkmosG3pbgUV9b2MCbJ
         KPpP9b14cgkvSwbBx7V5M5wUrOdP5irIntu+D01tV949IQUOu05nA9Z0Qox2oeNB+x+G
         WxK8bMkX+ajonuCGqXxcOdmfc3x2E0VUiTKXEPWd8o6FBzJmao3wJ7CjwQxn4G/oG8kY
         vzHw==
X-Forwarded-Encrypted: i=1; AJvYcCX4JlqfGyOItANRGv21BEeT4RX4RoDIIv+DYuqymw7CevA+bQiv57/1yAIy9R4yocR96hqpQDb5b6I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8a54Rw1U6cbzWWSIpeBN7XgvGnq/e49sDy50wy7LnWEycxB5m
	rlSjpZlkIzKnr4jveXyk4XTaxC4h6kUvX6G376DStQA48w0GAuuIQMALKMkTdbTajsHUMrXrqlR
	Z9eBQSw==
X-Google-Smtp-Source: AGHT+IFzwgrTUpyTLmlR4n7vLZlT3Ntvx3uZ2AlOGbeNdkR1Pz/L5L7m7JolYZt52l8hjag9eabuD/ERTOw=
X-Received: from pjbpf6.prod.google.com ([2002:a17:90b:1d86:b0:33b:5907:81cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19f0:b0:286:d3c5:4d15
 with SMTP id d9443c01a7336-290cb947798mr22501395ad.36.1760661189400; Thu, 16
 Oct 2025 17:33:09 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:30 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-13-seanjc@google.com>
Subject: [PATCH v3 12/25] KVM: TDX: Use atomic64_dec_return() instead of a
 poor equivalent
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
X-CRM114-CacheID: sfid-20251017_013326_022447_0EAF44FE 
X-CRM114-Status: GOOD (  12.12  )
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

Use atomic64_dec_return() when decrementing the number of "pre-mapped"
S-EPT pages to ensure that the count can't go negative without KVM
noticing.  In theory, checking for '0' and then decrementing in a separate
operation could miss a 0=>-1 transition.  In practice, such a condition is
impossible because nr_premapped is protected by slots_lock, i.e. doesn't
actually need to be an atomic (that wart will be addressed shortly).

Don't bother trying to keep the count non-negative, as the KVM_BUG_ON()
ensures the VM is dead, i.e. there's no point in trying to limp along.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 220989a1e085..6c0adc1b3bd5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1722,10 +1722,9 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		tdx_no_vcpus_enter_stop(kvm);
 	}
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
 			return -EIO;
 
-		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
 
@@ -3157,8 +3156,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		goto out;
 	}
 
-	if (!KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
-		atomic64_dec(&kvm_tdx->nr_premapped);
+	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
 	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
 		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
