Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E7AF53D69
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0N7nI7Syis7bdSBNrvMnN+XNiIs09zIKKQyujS+zbFA=; b=BHlnvyRajpPce+
	amY9B927bCDr6trHPZijBhNREUJ3CBLfEh9uMIFH1//rs/y6m9IphWy9SOV2VxuBJ1QoSIwNFaDqv
	7/iFAxxul9bf98BFTZ5cJ0DBvIzRTNcDJW3VkgkXd3gu2c/NqVLbATaaj6dpawDbUKDiF/8vpTabW
	COjs4ro2e3vvgZBhMsG8YdwYU1ZAcNWxJF50GKClAtNjR6d5msedtrj6zVjPmEGF2yleArk03vqxR
	SqBzBpTPj54fWbCbfXZ2v2i13RyEh4gLZ2cdKaqr+lDW+st107VJHqdB2BDcrB9KYjpGt/Gon3wQX
	tFPSbFSMrqY/k9H+SbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29gA-00000004J7m-10KD;
	Mon, 16 Mar 2026 15:16:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g4-00000004J4e-3BVB
	for kvm-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso39939835e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674178; x=1774278978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGf7yZtpUu5J1lX6HR+56oGmyUxqirhDSxD8uYe+Tfg=;
        b=Ts3vV1V3PMqXhHHo/A7SP4+zXJMG5lKmK5iqntAj8a2qXkDTSloqpRgbTv4hnowsTP
         gA4ytRe7dNncd2bO5BBvTgIQEuFhpms4tdatUsSwU+tQ63anIFzki6RugSll4vAYDBAf
         GbHaGcKU3VMY6RU+HO7NXglUb+OoOVnvAwMc2neogUX/Y9VUbiG/TS8PBodWA6MQeBnZ
         9WO0t2eNnGIY/YZ8dpeV1msws5Ktv/fvltmrMZrU1rZaloTjaeVmMgPGnZEozX/0ibXt
         7/FsXKiMYpF3xL2CHe8HLKRRFzlZcyO/34EfAfhdcOggkVUl7P2ambFbiwSL7yDuzzh1
         qXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674178; x=1774278978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGf7yZtpUu5J1lX6HR+56oGmyUxqirhDSxD8uYe+Tfg=;
        b=TE8E4WVIemj/PRi3pa1fhG0/ZR9S/VOxlW+fbvtETe5Xrtic24KilZR2bEZXenY11s
         Upt1OdLizDzf33R4SDK7S+ax/KKtdhiMCYo+6m2shDgkwyhimU6s6cMyySaD/qvkVjZ4
         29dfvq8D69F8o/eU8yLKY6dNh05h5DuuYUf3FwJIN+6jigeYdh/MS3DKAhCnFpE7czNf
         GiXInRpI6kCkbbeXIlU11/FBmGlBy/R3F767f8ZUv389W86f18dHZhb4HuhS8oSITGZH
         ZfNDTHsOPDEz9+h9TnkhCZGlD9ww3LNWCQHOUBV08f/hoe+Rva155mEmZg1588qJ7gWF
         JY9w==
X-Forwarded-Encrypted: i=1; AJvYcCXCrzp2zcpGsJaA9JvAlxoiCHLAnTq4UptjhxaH5gJTKV191/eRlTceKY6kSA3CEc9R4io6j6JO9Hw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgD6xtMlLSlBIt22ij38HrlJE39Xg5wkX+xVtCYkrmd9zwjj4C
	LMvli5QW3FgG1DEk7Ie8j5WfPDMbbKQuPkLHZG3yfBrY61yyfxncshv+
X-Gm-Gg: ATEYQzxpg9htBNqVxqEbqvT51OHA8oSMVo/C0IxqBxolL9zu7WanYgXoWkLGvsn+BiN
	1Mvcoj9lkXqRM7LZ44TXDc8OKySOzBzveZXlWCetapFCR65UG4IlfJHQMCgnmutD+LtjRn3XMOz
	zulxPBMDpcEO2QM7BJrvlFxVHnStNjruJX7Su/dd0SXlf4k54TI9F4SiEp+BbZK8ypnPRwSDUud
	JHSasRY4hD+gC2s46HdSvyyO2pExz2WfW+XwHCA5qMaE92IPoE8IY37uCfbp8kSYRZguw5YAYuC
	sYXRnPd1xs7SmzRmMdl3eg1K88S9tYD074pPcS0BK7qTV4M3y4SJQtAcUBoy8ojpbq0NrD+GTJQ
	JUJ1YGTMvhc26uT1fHYDitbskTlIiDywagYJdcYLjMms1neRqIWs3GG216cTMIKeUiWr3zJcBTy
	0fVvSWBhzzpkOMjaNEd27tMCAKMgkgqfRINxAPlakutMVhD7EM2ppPzoow5w==
X-Received: by 2002:a05:600c:c162:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-485566c94a6mr221915275e9.2.1773674178274;
        Mon, 16 Mar 2026 08:16:18 -0700 (PDT)
Received: from osama.. ([102.46.166.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556422338sm99206145e9.7.2026.03.16.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:16:17 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andybnac@gmail.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] riscv: kvm: fix vector context allocation leak
Date: Mon, 16 Mar 2026 16:16:11 +0100
Message-ID: <20260316151612.13305-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081620_867114_DD73EF93 
X-CRM114-Status: GOOD (  10.37  )
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

When the second kzalloc (host_context.vector.datap) fails in
kvm_riscv_vcpu_alloc_vector_context, the first allocation
(guest_context.vector.datap) is leaked. Free it before returning.

Fixes: 0f4b82579716 ("riscv: KVM: Add vector lazy save/restore support")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- Add Fixes: tag
- Add Cc: stable@vger.kernel.org
---
 arch/riscv/kvm/vcpu_vector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..5b6ad82d47be 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -80,8 +80,11 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
-	if (!vcpu->arch.host_context.vector.datap)
+	if (!vcpu->arch.host_context.vector.datap) {
+		kfree(vcpu->arch.guest_context.vector.datap);
+		vcpu->arch.guest_context.vector.datap = NULL;
 		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
