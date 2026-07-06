Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174FCC44500
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4KFnP6W6P30qJ1t+ZWEyaLB7uAtc8Fr4iT5nryg3VM=; b=fx/VUEhLducglf
	98FBfIYCmULLERkXgVjNSyHDg50O5dDWB8y1AL17jXVezR/g9dfKWIrMIv2mafTSnrLv5j+hDE0nE
	bLeMlHdCgRzDfafEuDnTDvdvUC69xmzdypXsGuIyBdOwXO7v7VDHSqeB0AcZzZ9nLBPhsD+ZSmu9r
	u7i86YVd5jiWwx77vw1raMDazkAJjQI96TpSnJ2Y+8LaeU+muUT+o0zbb1btGy7f0NFE8z0kifzp3
	dnYpM2bcmjZT2lSLla7x6+oWa+K0lnzYv7Pq9E07clP5SyJQqPyDktqissf1IsqSl45qTini9hZRi
	w/7pdOVH7YzA2O08gNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp9-0000000BMdZ-3UV3;
	Mon, 06 Jul 2026 02:12:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp7-0000000BMb0-11n6
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-847968ca62fso2493150b3a.2
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303960; x=1783908760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=cMuq8iCOoSwurl8dcn0zC+XabPmgPD7a2Uw3OITAVnHnQ1DxRlRveYHyc5+7pqAwPJ
         5pzc4gbqw9AJh4pDrTmEiDX2Md8o9oDf/WUWeiZOxS2BmHXGh3tLqFJekNye+RmlVsKw
         LvEw8ICHw1JNbwzxgh2eAdNRPk7UXpgVR8ER7AxVSsUVCiaHtG8+Jot3phoOFvjZFlAT
         E/o2vkodsRM92erHzQ/47/IFp4XiwVIILhiO5h9sevUBlzJ86+Q85nzWMQOSQQhFfBEB
         CfqpN9ZRHMWwuHLMQyrS91R2dBo6CqjEHZw2pMRXKW2uz4McICkNHkHE4DMey7Xk01qN
         c3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303960; x=1783908760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=RKwodiIt5vbC2S9uaXtGVkYrgz9QkdWg2TwQcd9TH6XYOO6vaTlheIE30vDHYcxTIT
         icjIbHT8r1zLUZp7wzMNasrsnwJBetCuEEDQjGVREBnCQmI2/Kx99LnhV+BlFIXgNALJ
         T/UWOtl2I7UI1RAfGOW1B0cE+/6Zxt/aCdFI5gR37rl8XDHj8hu4Y9X+SCeMiZAr91Ok
         IQgQILD5p6EQHQtoioftlzCm42/ns8CKb7A8i/iET1/c0ZyBI1uPOEvC4iTf1pjBtGiH
         WAKoLaSZvIJ7Fz1J31uPDnmhFNJYj+7nJaOsoLgH+d7r64sDVONfe/LRROt7djRU8fLq
         4+oA==
X-Forwarded-Encrypted: i=1; AHgh+RoPMT88QCvunb0mq+KZvckzqUlis0V8mwtlz36MMyByYcnRNBrAi5EhoDNGIUzyQ8b18TF354uXJ7A=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb3wVYLdFi0zL/cK0viHCHEl3KmWrzIRzbn60L9YUUcrWHc3W/
	xZlfGWTBgsV5hBbTdXcPgguCrEOHqD4eAh8qRkeimpE7LrUh2r/5mg7t
X-Gm-Gg: AfdE7ckcRR9el8sE6kmyd2hMneYuWYlzLhHbgsmq+n2WWbW2gQVWet9+H26HAf7JxFx
	O3HX0pa+KStgmWCrB6NknA1H5M+Gg3a/GYvJz7tioYUpr4pMij5J10yXAHnafe8X5i9XI/AbKib
	A0U+1F34UWCwIZewBmK2CwLgW/jdBC5pSkiYDNygRL1ybn+4qvayKfom2ssa6oU+yvml5krm038
	wo9n0I9fi/cmEn1gibM48bga6MjqWeYRNtIDp2u13eLyX9ZWKk3fBSkVHKhKKfmrb3zxNNUs6CU
	ScgvbI1yzq6AuWMXZ96GWtaIQPbaDzZZHyk8zylEO8DuaJGR665zAEjbvgSbaGxmTEpivta06EH
	3gw2vt3337hGdC+Xn+SeyJc2Xq3sMvMIYlQfV88as1jnxbwhqQ++x6uhON/CoRGcR
X-Received: by 2002:a05:6a00:2d99:b0:847:871a:94ca with SMTP id d2e1a72fcca58-847f6f3d63cmr7231493b3a.41.1783303960374;
        Sun, 05 Jul 2026 19:12:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm2835970b3a.31.2026.07.05.19.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] RISC-V: KVM: Reset the SBI extension when disable it
Date: Mon,  6 Jul 2026 10:11:52 +0800
Message-ID: <20260706021154.210289-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706021154.210289-1-inochiama@gmail.com>
References: <20260706021154.210289-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191241_299053_DE3359DD 
X-CRM114-Status: GOOD (  12.42  )
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

The SBI extension validation callback can only fix the parameter if
the extension is enabled. However, if the extension is disabled after
modifty some parameters, the state of the extension is still broken.

Reset the extension when the extenion is disabled so it can have
a clear context.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index b737e9a7a12a..3eb7b7c57059 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -221,6 +221,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
+	const struct kvm_vcpu_sbi_extension *ext;
 
 	if (reg_val != 1 && reg_val != 0)
 		return -EINVAL;
@@ -229,6 +230,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
 		return -ENOENT;
 
+	ext = sext->ext_ptr;
+
+	if (!reg_val && scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		if (ext->reset) {
+			ext->reset(vcpu);
+			vcpu->arch.csr_dirty = true;
+		}
+	}
+
 	scontext->ext_status[sext->ext_idx] = (reg_val) ?
 			KVM_RISCV_SBI_EXT_STATUS_ENABLED :
 			KVM_RISCV_SBI_EXT_STATUS_DISABLED;
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
