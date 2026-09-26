Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ADDC98318
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1YlL9NwYQ2L75clkPcHeJOAwRfWjzmZsuJyRKRxjD3Y=; b=DItcbXvBlx1Yk1
	KbB8swQuAGzW5/v81HzSI2HLzMCIPJCfspp04ZuSJaH5znhRQGJjj19g71D59JAEW/CTpjotR2ek4
	Uaj/g6N2DH4h2clh1MlrQWOsICBK/QJ++mxI++HrGJxBxC7FtEcAONrkayAcP4/GYHVCBwlp3aiYi
	kAcvMlBUCWaO6NHHttY+DFZHk+dWlHNaw3FA34kXcG58NCyXpWYoqahpYC9r1zN+9kzgwNpC7PxcP
	Y6E86EO0QRz/Et5GFcTRC93in0ceecJ3zptlnhpO7k4SDIvNjkIm1AR9BqJRN0r0EOxqboFew2Bv9
	GZ+oB9iB2VC4gvg9kWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xALKt-0000000F3HD-3AWB;
	Sat, 26 Sep 2026 05:52:35 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xALKp-0000000F3GQ-3hKm
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 05:52:33 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so1210267a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 22:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401951; x=1791006751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Q+AEMs+1c3HlByet+UhGr0L4v7ZQfIIBKxcOD9TNJ4=;
        b=eKIA2oo3DieC7axAZbbyeLSefQ7/L9U1NTgUyx1hykAokE7ctwR4LRpl7KZTZzKyiZ
         WSvKzJj7NxeII+VkDkyxIbxT/cDtjlhK64hz/ikaY0DBjFdqmUDHfV9iCrUm4XzH7MXS
         G2Xcj0bmnEnmnj5QhtYzfkbHg6klw9jcgp7wpPtOtTvkh1XziVuyrQ2BaRVV4wTNWVsM
         NhruUq+0n5K3/EuoeX0zAtIC+Bb8cYi5Q3bxeCVBdFb72rmTyzeeN0goNgTsbQek95JE
         ZEF5NvHVVNU68Sd05FLhQv+UJqnUvdsWrw7IetUJnHx/SWO+nh2O7FJj2Zib63TpYIKw
         eHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401951; x=1791006751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Q+AEMs+1c3HlByet+UhGr0L4v7ZQfIIBKxcOD9TNJ4=;
        b=hMWACByA6wgvhPM+oNbMstIwTEnvzbf0CiqG6NLYi/kspxxYcMwnkTg+zmTWN17jo4
         gxYDhyTSl3XzxYzVRHQLROoEw7OHSU+uiYbdTdOTvsz46tiBoVubBOInD/XhnGKS8/3L
         kSyenkQdCGhhQGC1p1q9/CkyHtMo+Dsw4n4yGGK+RvXWn7sJJePqL6xAtD89YZ/jpTQ5
         x+ssjrUoqav2ZGEg7FZAU+U7YRX6bR+aWnh9ENJa5Sg09JK6NuZ1LVoaQADblNVvrswt
         HrBKarpAJnFX+vLPf7761i7RET6Zx4xck08IHlpB1EUUsCetDKge0o69XkD6Ekc3ZAn9
         /3GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBldujd4k0AC/cHMyALV0hou1lYzA0yrIUqDZcp4RpTdHWye2ld3t/Sj5ZP7QEUIYSLZxVrCe0Z3E=@lists.infradead.org
X-Gm-Message-State: AFuF++m+cyrH9+HuKFF3ZKHcpZSgJ1bWwRwUEAXZkBsifcjCCtexD4yt
	7+c/c0XRsh/sgnGRG/wGVee33b/0euZiV8zZTBW++m9XcpNnfNQKUlbbiuivLTIf
X-Gm-Gg: AYBFou19LVKLzVgxayJ4RDCrcUTElougFw84beedo91q+gbMs2uXOmVjazFml1x3pjL
	9CvPmtxD5ncA4vNb8ErtB6VfoOBiGdEA8vqpvqV2Xgq3lRLrqK3OY7xeA7wKst/1AJTGShb4Ey0
	fJRMCteQFyrhNtZXiVTsMHhQorUmk2YCTKMwAbA7YWeZ0bSHJsOrkGCyqNe3AMx2ZZUlPsHJXui
	H3XZHZzENNuVVY1eaihgSu8d2+8llXEL7Jax78l/l2h3Oa73viAGE+qE6HXp9gEHqb3AzFSU3jf
	Ruk9Za1ckc9/XHEijeEaso8ailRKxffTnBht38jf3OFYm0xqIKkELrIjHCtH7tLZFuY/1Px1Zkh
	bgDvCx2xuKjMNPT3QNqMFvIczra5YXol2FUaBw8pohz4LPPHAzig3FpVqPipN9CKHZyFmC91dgl
	pk9VB5oDpMXdwXXlHR34eBry4IvGw6b/PkIjaSMzzTPKERtevaVpy2WhKTsmMuDjR+Wv3PntuD3
	wRLZnupAmKVmWtgEaOMZK0lPhXGWnF8kLdCDvbm1MaVdTBNPQxG7J1DsWpqBMBInL1nlnwd/akG
	RpWhzALW3b8LvA/EAkvF8SX+XMfYxcC07jP0UbZSAoNW+Z1uK9JhBGUi9cc=
X-Received: by 2002:a17:90b:570e:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a0bb662a35mr2868982a91.67.1790401950853;
        Fri, 25 Sep 2026 22:52:30 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm7897504a91.14.2026.09.25.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:52:30 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] MAINTAINERS: name the kvm-riscv/linux riscv_kvm_next branch
Date: Sat, 26 Sep 2026 13:52:27 +0800
Message-ID: <20260926055227.3678332-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_225232_517006_77E88F6A 
X-CRM114-Status: UNSURE (   9.75  )
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

The T: entry for KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv) names
github.com/kvm-riscv/linux without a branch.  The repository's HEAD
points to branch master, which mainline already contains.  linux-next
merges the riscv_kvm_next branch of this repository (Next/Trees).  Name
that branch in the entry.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..16f6b306adf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14357,7 +14357,7 @@ L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-T:	git https://github.com/kvm-riscv/linux.git
+T:	git https://github.com/kvm-riscv/linux.git riscv_kvm_next
 F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
