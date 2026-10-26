Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77003606A31A
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DD0L6SkI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BCax3knn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zUcq9xlyWAZccjvPZFDv58gaIU5pzWMAG0Q4JEiMw0A=; b=DD0L6SkI9L/2bI3jJtW5U2hUIc
	TwHKzwV5mxrWMPoPKzHHetTEfkQWyhzqXlYLm57gcVVId8+yoIZsUQGpv48EYW6Biu4kiNUcPzsO4
	cqnZVGhLJgqSVJgqOzXTdw3eYJdzHuwsgQnU3n+YtEAvRj8EL5QUUlQrGku7YaZy5BMpXlt1KZDT4
	qaY6QM1GnWq2RGtQcjxRP+NmJJc3X9x6bURkbno2Zjjugo3y8jYte87RAfp8gdxMAwv8bS7dI0y9N
	DTWw2k22q1s74De34gbr3rIyzK4rLqHPMs6Z+sCa/63ox196Z03gpPUvRFzBD+wzHtkjh/7lnsozJ
	d69g/DRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBWw-00000001fM2-0eWK;
	Mon, 26 Oct 2026 03:37:50 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBWt-00000001fLf-43Qf
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:37:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso1350817a91.3
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792985866; x=1793590666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcVF0+7J4tCY38BzQtPDDFcEioY3MRDaVDGoLP3rSf4=;
        b=BCax3knnz/Pde9zUR+cKGB+5wvYM2oGGBgRl39t9aRyX/YT/t2dy0LYi89USNNEcSe
         Qf6ZyLDhz4KzQ0YxeaCAqJsl2G0oL4ZqkHgE9B+t7JMNob3Fl8nX5fOOMOgi2gM7UtSE
         EUSJ4gpIItJAoErzRmjFX6BBjmdQDfAJGWxTRbKyqYy5EMDl+4SNuQlYpM9Lb5Bei7oC
         Z3OrNYHPNcV0FVPFJ2KBCP4NmXbsT/xtdK78gD3s6u2Q88tbF73wcTBAgMALVdQNYU+U
         Dir3GTsu5m5scJTuzdve4pITTE+k7mtppSg6G18d9oHsodXyr1aOlKI/LmeTwII4piex
         Xc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985866; x=1793590666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcVF0+7J4tCY38BzQtPDDFcEioY3MRDaVDGoLP3rSf4=;
        b=CwKM1nYmjkm1NDJKcJ44tWJHMx4yueAr2s4hi43AIE1KLXG3A5aE1Qya97bETSbMbq
         eTk8dAIcHTxZ90yvloetApGIZy6D1bNsdTF12Xh+DEPq7tJNURp6wawnDUZNZqqBBdXc
         mHdvzKrHwvhbU+fW02CKjeEgc4XFuHOPlcTAJJWBu6Wz0RY/UFjfw5pI2GgoI39AUxbw
         MEulH60JlMzvs9pKzIOZvZt6rdOZeF5l8F7LMSgk9dnArUVCrVmDL6OljRC+Otnh21+F
         kuMMbH+0+91jlau1razA5cbEN4s9oqgpld5u97nWuAw092TOrNqNB5l5pQbxD/LkPYWn
         37vQ==
X-Gm-Message-State: AFq9FYKVUJY74ri5mcQS98a1QBUJswiufq1oeb0XJgw9FPr06h4FG3i3
	x4lsh0Yu+zVtetPStnvoxBo62IFaE2tcqgtAUtzyzegpMz/7lmrMVkXXpnxhP6zYhOn6heLIw2h
	cXUZHVitbwQ==
X-Gm-Gg: AYBFou0l30gw4J5uiAi6kxdSSFCoEht4pwbakTqATWkucPqube9RImogG5ZysTP283M
	vPieUui4ydOmYy2fJNtm8T9ia6SoAlSWAz9IfXVz/sLg2WknkQAuLJwh4xPUd9LOmMjSsg95Zsw
	rMtLsIlVmB78Pd9g4IkJobAN/UoYcBkiyIf60uhiP+Wmc6XEyyhIn8Sv2R+0s0E1YlGBmRgbYWW
	4Ol4rVSxbG4XvrARBp+93rUz+G3ga0qTYc0qTEUYsuaDf1fzhcVAKYIatHtX0JrOKcpI1aFrFTZ
	nNuxgAyyT5PQa5w2Pv4gIhPEc6buCtGNFIfaEXsZSpdPLf3qF04LR53G95zply257P8CvcIZ3En
	gqPAfo8Oc+Xa8hUpD4JZfc8VpU5DU/3GBSDYUymL6FFX3mRV22ZUTYrX/UicPaNajHsyRh5JHvR
	ntYdamfkTaBvujXj0IjIvcxQ6vu1EFrsqQxDqKO1tYryizGuDLfW9VuvxLH9N9YxZGc/IkITfsz
	LlUrP745PzjSkOKq77jTxHGOl71UHC1mRtOCNdnJT+BuzuSEHKEd/eKGbWTeLPt0VLoOUDcAnA=
X-Received: by 2002:a17:90b:57cd:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3adead48641mr4554613a91.38.1792985865903;
        Sun, 25 Oct 2026 20:37:45 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f09csm6754815a91.7.2026.10.25.20.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:37:45 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org,
	Andrew Jones <andrew.jones@linux.dev>,
	James Raphael Tiovalen <jamestiotio@gmail.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [kvm-unit-tests PATCH v2] riscv: sbi: Fix timer delay measurement race
Date: Mon, 26 Oct 2026 11:37:38 +0800
Message-Id: <20261026033738.96294-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_203748_015604_07FCE60B 
X-CRM114-Status: GOOD (  11.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The timer test samples the counter before checking timer_works in the
wait loop. If the timer interrupt arrives between these operations, the
handler sets timer_works and the loop exits with a timestamp taken before
the interrupt. That timestamp can precede the deadline, causing a false
"timer delay honored" failure in both the normal and masked IRQ tests.

Check timer_works first in the wait loop and sample the counter again
after the loop exits. Use this timestamp to calculate the elapsed time
so that an interrupt cannot cause the test to use a stale timestamp.

Fixes: 14fa12b1351c ("riscv: sbi: Add test for timer extension")
Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
Changes in v2:
- Check timer_works first and sample the counter after the wait loop,
  as suggested by Andrew Jones.
- Drop the timestamp field and counter read from the interrupt handler.

Testing:
- Cross-built riscv/sbi.flat and built it natively on a RISC-V host.
- Ran the SBI tests with KVM five times each with 1 and 32 vCPUs.
  All runs passed, with 15 tests skipped per run. Both timer delay
  checks passed in all runs.

 riscv/sbi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 3b8aadce..5633b1f9 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -292,8 +292,9 @@ static void timer_check_set_timer(bool mask_timer_irq)
 	if (ret.error)
 		report_info("set timer%s failed with %ld\n", mask_test_str, ret.error);
 
-	while ((end = timer_get_cycles()) <= (begin + d + margin) && !timer_info.timer_works)
+	while (!timer_info.timer_works && timer_get_cycles() <= begin + d + margin)
 		cpu_relax();
+	end = timer_get_cycles();
 
 	report(timer_info.timer_works, "timer interrupt received%s", mask_test_str);
 	report(timer_info.timer_irq_set, "pending timer interrupt bit set in irq handler%s", mask_test_str);
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
