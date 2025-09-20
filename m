Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD87CAC5B0
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKZKmpa2CReigsWYECU4hFIvMJuIj7eDDAR3tfPMYBA=; b=drhdZn3j5+H8oQ
	IRBH9ySOcbyWtnGy/AuadqIU8hU+2NdrifTOBqsNzzOgr1Y32pmDxezK3W+bCQv1KWH46PxyrRqPI
	O1LMgENOsr1ispkJcHdUQXG5EhqRV5cRwOKQ2CL6aRFD/v+eCmr7+Q+cjG8cmmUvr86SgPzKMoArb
	wECk3EghxLwifs8fm8yb5ImgBWAj34uT1hluDix21NHXQ3mRwCxo0UYBpu/BRaSLj/FYmtbmu1Ig7
	bVWizy0eUFnRdkGfu03THW95J/a4p7yfTc48dEOn/GLjVMinWowoSc+kIB3AFK6XDNCY0wFDuMVlH
	1vGf0pleehMdPWLdiKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Me-00000005u1W-2mp0;
	Sat, 20 Sep 2025 20:39:24 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MX-00000005tkE-0VTS
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:18 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4249327319dso8145685ab.1
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400756; x=1759005556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDiaVjHF4kERpiNA+aqN0eX91N+wRKnw/AH6MzFfvy4=;
        b=pQARDDUgtF3U5DQBVpScECDrgbbj2sNkFx6uMoWi6M7rEdDQHZU2gQNzeH6kPDvGso
         NsBlwgTNKUcvDuqL6tqhVygIIz+0iVyIcfXA21YOhdPYSeXnM5ttb0BXCym1HKOX/jyO
         eqqj97MjB9NeZORWUCqqRa10c3tTSzl+cRdsYAc0f9EP5A4NBGFUWgEJ4l+W+jxK3Opl
         vgFbF+J0PFlnHzSfwo1nobXuLL/CwmkU/c62EDej2U3zsu/+MweZIvPZeQfGurX+0ACy
         unkEiwPRICzaQ+hzFDDTy74Iocp7wTv2rTRC620OyPEUN52A3GAFjoq4OqDlOXKzBwty
         eQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400756; x=1759005556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDiaVjHF4kERpiNA+aqN0eX91N+wRKnw/AH6MzFfvy4=;
        b=bEzR8XRHMTOMFHo99+Qumw53mAYXuR92jxPp+v3JAW43Lpah8+19ieQPliqdsxENf/
         0vOf/y1svqJ3xP21RIqPUeUMaWTf9ZD4WqubE+6yBYzRiNSpnLv0pwGFtScHVIBCQl+O
         bmHYrbG63gS+/bf2Io0IRsmbjOZE8Zk+bQgIGjr6jvB+RRc3CX14BHIxxG3uOb3J+dMp
         hULxRnORHPe0We9zAeWkkx7P6gSsOofj495T+ueLqJUjKfn2qcn2bFfdUM6lGg0YetN1
         vjsAbogbtH9fsbX9pr/8YA1fs0UISWcm7UncmdkIz88Gy7/fHO0HGJiUi3Ma2ocAB45u
         mp1A==
X-Forwarded-Encrypted: i=1; AJvYcCUKS/zdSAKo0O9FIrZP2k0lv4OCyV3q/x6jABAd0nHXHcRxIsQidXupsYE879m3vOwFVgcokPo5QvA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7MQUz5Sx8b+wJFg1uyhnPa/7vtCb1SbrHbU3YMsd2kqnBdWGY
	1b7ffgzY12xR/Mn1StiAISZlhyAHya5q9aWoyUb/bOvvVzZSuwn86HuhHqQNSGmzewI=
X-Gm-Gg: ASbGncvWG9oNIORBhTJo2ShRCUPSkKL6U6WB5dKs2HF4cnCgmg4QL9d09krUJPLuV8H
	4hZOKtBHM8dCLts5DqSIr3QOYPpCuRTfuBdzlOAW9xjPF6YnhXbQTHus7kbmPq1MKdIiidqCgYF
	3HDrYiE4ePT+aCgzdC4WIF4jvlAAzYsSv3zKnGAZ15bkg7KCutUSfyMpJSFz18C5dZtJIiQO53f
	r7vlhjhW3Rzk7GLQzn4sHyE4th8HDIVXD27NhMuw1nGikqD6BZaWfUd8mK7lMzdTsIBxfh6Oj6M
	BPH26uuIcnU1YiDIYnolgJC3SmvhSonPqIcyjpf3ESmLBwxeiwmOyt+8v2dG3wm7jsvcXdUEhQP
	ZV7Mvy+Yu52cTvmbpd+7jPEsr
X-Google-Smtp-Source: AGHT+IG8Raz8xeq0QgKszu3pyBicegyYf16hU26G0T5WrFouzicPpKiOvFexp2tE8Gc55HnrfGmbkg==
X-Received: by 2002:a05:6e02:1947:b0:424:80f2:299 with SMTP id e9e14a558f8ab-424819955bbmr133419975ab.27.1758400756210;
        Sat, 20 Sep 2025 13:39:16 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-424804ec921sm30642665ab.43.2025.09.20.13.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:15 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 18/18] DO NOT UPSTREAM: RISC-V: KVM: Workaround kvm_riscv_gstage_ioremap() bug
Date: Sat, 20 Sep 2025 15:39:08 -0500
Message-ID: <20250920203851.2205115-38-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133917_221402_34770E2F 
X-CRM114-Status: GOOD (  10.20  )
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

Workaround a bug that breaks guest booting with device assignment that
was introduced with commit 9bca8be646e0 ("RISC-V: KVM: Fix pte settings
within kvm_riscv_gstage_ioremap()")
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 525fb5a330c0..994f18b92143 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -56,7 +56,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
-	prot = pgprot_noncached(PAGE_WRITE);
+	prot = pgprot_noncached(__pgprot(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ | _PAGE_WRITE));
 
 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
 		map.addr = addr;
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
