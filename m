Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE05BF433CE
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t4QTMj+VA1T3qUfDS1+xfoInu7076OxR/W/FoTzmNys=; b=GGfYvnP9vO0dx2
	YkQ1bteqdCAGgXiSUolO/EXKAfW3iGZ5Ada4u0CNGJLEuBRhjEo5bMPlBdvS9b7IwnAAWJuH51pe7
	tmFFR5+0DkrfufWhQpJVPM3GQaIEzjjCU7mRi8nxUjWKk+YnnbTnbgsYHLZz3MnDYhyVEzQ7Xuv2W
	kqmdcN+FW4z7RkMkfy9i52BiKdpm3crricTju2pRY/FnpWzGDtCRYAI4610FVsBNlGgKZlqpjwT3c
	jyzULxe4qWa5BlM1Phoacb4cUr0uOkSSANMH1ZqeYBCGE55hHH+PEPPfcH7CHjcLSgrrURtbyN9to
	OsbFVNeHVFfdBKB+iIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8RO-00000001fJ2-10ol;
	Wed, 15 Apr 2026 22:10:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8RH-00000001fIF-1DTZ
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 22:10:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso71849865e9.1
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Apr 2026 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776291025; x=1776895825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu9AQw7MI1mCAjsGD/n0+Be2DCItWXbhRChOUsm24MI=;
        b=F/NzA5xM3sfj/palAWln3SSJeciKURawdAKImfmJGAMRFxvJWJqV4cGkyR649ddcL5
         btlL1mw42alVRGxgtISZix36BiBraiZ/qzO8c9glyxH7hn9Tvj6EdXGW3ugWvaMqYIpP
         F61hi1pJrUvrFNkg63LUjByJG8Yht/0JdGQOea551vO1cMiXr8c6ioL73Ck4R2M2TdaD
         8sZIcY6Paz1Ta6aHQ0DSdBVU5lAoRtpLIC8+wna+3Bs95O3EK8AC791zbnnzTclp/yk/
         WLVBEmb2ymH7BrpsdqXOAKLuvlqPicTfL9FOcWHgN3S3B6uEk0YIFPT9FgioPpiQvboF
         BqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776291025; x=1776895825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu9AQw7MI1mCAjsGD/n0+Be2DCItWXbhRChOUsm24MI=;
        b=mysa13v38VQNWe5X+WWIHNo0uVUOmWEmoKRwLZ7LXlE6b0yQSSuNFercamF4Y5CAhq
         hJC/OqUGbS/g09E/qAmhnvUz/sZXtasR7l34BfTHCmPDJI6i+2kdY3i5lhWxUL5Dz7kA
         lwbrdjUOz9+7op3/ByqrFzWgQAO7MKHI8qXcwdyzDa5do6ArGQ7fc/EjwkiJtoxamyod
         HYX3cUS0vKGHiBHMOgOKhXMBSF2bRgxgNBlmUdLcbqad5B8QXXYnNl6KXu/0pvW8Nl0D
         JTMN0kQ7QWLjmbNTwgN2PK2Bwk2Q82c8F3GokZRstPoI1B+8198qfOPjyG7aOLHnT3+t
         4m0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1ZoVCdDZaqo6XpE56+s2rTIjgsRTyrraFYNoqFpDJji0LOuS8t7IfzrL9vD8miqxOIdsJs9O48sU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9x89Ri3MS7eEKWA7SjkEbzMZj4ewS1LYCxU+0hklT/BTZKOS1
	sfdZULyxKhoK0mSvk59HZUu83o8QOLE+WPibCZq/VFLx6sZvqmZnxNv8
X-Gm-Gg: AeBDieu31gwngcY3v4ckpTXjWmEJD+Q0jlfKMA2RFcPZ8LM8EeMNP4Kf7Q3aZQbU/Ii
	vq981SAsAGjd1ZGYTs7buDp/9Fq+GQvbw/VFGDDR6chunzEQT/NBA939eWn6FE3+x0Wvpp0q0Si
	zskyewOCXJCs6kAAXMUyZDGc0zRJMcRxlvOvKOkWcLQwuwltVQSDnTOe2JphoomP2jwgX5ZUgtX
	qvF4xrXHBiEwron0sCnWkeJwClJs4CgN5S3ia7y524IcCx57zb985PNsI/zT1I1oGKXJztgmdXA
	xyoMSh2VL7DAnf8qkKskK+44rV51Cy6eoHaANtBspWnQxH7zv3+LC1hKSmoZJcLlf+SQMHyEeN+
	uGOVkg5/oknnREx4LQKK7V2ZSlZSJ3+BSfDg7b0AgY4/iwgkCazdorOPlbkQvjBDVH5sAOPxoBW
	BnEgCMsf5xjE/U8zYhXZRaCT7VR2Dn2x1gcDW7/vrJqseSFaca9WreQg4MHVY=
X-Received: by 2002:a05:600c:474c:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-488d68101edmr302262415e9.10.1776291024748;
        Wed, 15 Apr 2026 15:10:24 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:d20f:daca:461:1a54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818e51sm2095695e9.5.2026.04.15.15.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 15:10:24 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
Date: Thu, 16 Apr 2026 00:09:30 +0200
Message-ID: <20260415220930.287592-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_151027_974554_8E751D53 
X-CRM114-Status: UNSURE (   9.89  )
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

kvm_riscv_vcpu_pmu_snapshot_set_shmem() and kvm_riscv_vcpu_pmu_event_info()
returned -ENOMEM from the SBI extension handler, which caused 
kvm_riscv_vcpu_sbi_ecall() to abort KVM_RUN and surface the error to 
userspace instead of completing the ECALL with a negative SBI error in a0.
Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
handlers and kvm_sbi_ext_pmu_handler comment.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e873430e596b..f36b099f447c 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -435,8 +435,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-	if (!kvpmu->sdata)
-		return -ENOMEM;
+	if (!kvpmu->sdata) {
+		sbiret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
@@ -480,8 +482,10 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 	}
 
 	einfo = kzalloc(shmem_size, GFP_KERNEL);
-	if (!einfo)
-		return -ENOMEM;
+	if (!einfo) {
+		ret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
 	if (ret) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
