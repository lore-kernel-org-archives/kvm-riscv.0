Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16CF606A319
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RSoyQGtA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KNakYSyp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1cyy060wwA9o1mEYgWDqNiZGEaGF5a5GgTQrJLeWkcY=; b=RSoyQGtA7WCrukc/KYj3wIgCTF
	no9HL5+SUzsEIoX+D9b/Ri1oM4wkbnRczHZfWNNP802xYV3mHbPGgWWz3SS0PCHA7CymsMCUdTkEH
	Zd4lhrTBaUsAsZ2rxdLg3jQmnSi+s5azIm7yV/dTM+qUbCdLAOmbY1wKSCQtl2o80bM0EyUrxJ16c
	wYYv2P+P8buhgIitkRCZlcRndiRLPcUtldxTdGqzCGJZvJIGvEnftAjRoBDGGMSNg2+WLa2hg/Nen
	oZfxwVftno8whzE/zs52FRnhVLdXquyE6fc4c2VDTiIhlrcvT+agXXfH1ROU5Iucvs5vt9g4k4zab
	n06447kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5aS-0000000FMuF-1Pq9;
	Fri, 23 Oct 2026 03:04:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5aP-0000000FMt4-39Ba
	for kvm-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:04:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so386621a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792724690; x=1793329490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ApuWDp5M/WoLyzPayp9OLv7sPY8GOMyShINb8lA2F0=;
        b=KNakYSyp384QuKnWmRtZgcdtfJ5WHTto9jM/OTF4M3rCr17Ki5NQmlS4/36P6Yp9VO
         goKSC0nD5rcGQ7tklC//X9B2SnU6wz/O854lTH7JSlzIH6rGKHhITp8tdYeSKnw4Aa+X
         2HwsgS1bqixYIMR9+GesHY+S2GnO+CdyV9a1sIEsWK8jAiRTXmykgX9mzDlJTVnX6P+j
         YGG9mFOldrP0X4yqnk5rAUhzIKoiPjtDkQQZlfnHVdsGrx6YRX8zJOHGNnubqEd8SlTR
         tO+So35F4IV56zuaRvuyUpc9g9SwxKpJ/2JnRoMG4aC8nSWPnO7QB7vkPlxKD0nFCE+I
         6nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792724690; x=1793329490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ApuWDp5M/WoLyzPayp9OLv7sPY8GOMyShINb8lA2F0=;
        b=ez+pnXjcWZmEi6hMXfEW0K/20HWLd35mOxZ0SNT7editlJNxjRK8UvHYGt5HijO8wa
         YtkpYP52NBEW770mOSlpavXhwHc/KXDsuLNdgHHTQQE9z6ZkDn/VzuzJVF7PsFzuBCIf
         kD+qVsuW5MFDJRqy56QzjPeJR8Q2gz4APsnVCdPNRRjgcTd/i8hXVCh2ZYiuoyBRQlVq
         BxqBrzmh1b6szkPCL2wjMBs515rT4Nq8M89wKfB1w99btFDKz7umbCTumTOnL/zLVRdC
         oPrrtwij63Vs29t0ekLaKWldjeb6gVnUw2f9TUtyr7VW/Oo1P1SjgyS5eCIAfn4BUWxk
         zlqA==
X-Forwarded-Encrypted: i=1; AKwUvBw99MDznC4YBn9cPh6bRID8o/bScUAI62W0g2OcrFDV32dtiR7tbQvQe5/e5qw3X4J9sautPf+6g/k=@lists.infradead.org
X-Gm-Message-State: AFq9FYKQ2mRi4OPdCLCPAufyCmvyBO1PxrFwPcsQR4/E5WRP39OUMMq2
	vPsEtZHH/Y3FUnl3U+e7U77TTBTjM11ANaJD/xqv8yDjW7XyIKtUbjl5z1nKrA9Rztk=
X-Gm-Gg: AYBFou11cowqci2ko0BHwOvINUsXO8R5nY57A2Y4i+4947b3TFkm62w6bdohSyvZ23e
	9t+TpafUPYpbrm+D+Q8xCbOtRaO8H/OqkBdQQ0oCUhrbmiRTdPJfUtQeG85hcTfsaj7v4W2+Ctu
	xuaVsKOFbZW/rbCoJB/Jg8ZQageoaG1Qehg3LIX/C46eGBYqV9M7rVFP7ms82hvb/JucUrvSibz
	ap1qw6BLe2aSJVMJftWNCt3lBUVJBnXtkmEj7BxzVEX8TcD0isGko4kJV2MQTNaOD1Zu+Uxj7La
	Gkc/6nuWiGRBKJMMO9WsthEhZ6FtySA7bIf6+74D5M1h9iMGmwuhUCtTDDegJRE56xtn1QnVFfc
	JkhzswtNoO/I9Wc5ygt9Wgqoj/JWQ9VNG9XuSLIX+g7qA3z+C7qn8JHsw6MyACeWA6EjkdES7mD
	T8q/jqfTvjfYvwpy5qZBRjwxNCbGxReynw0KzlFVZy3tM02dscywhm3iEPXZyyQEXMzvKsdjjxp
	vvCl2QBE0Si4DF9Pu4q+npsAJF6z/ruV7iGKGfG1FAoOvO3Nr7cEql3sqCe8y/xF6P5nP22lT8=
X-Received: by 2002:a17:90b:5185:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3adce873fcamr721378a91.57.1792724689764;
        Thu, 22 Oct 2026 20:04:49 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49544f1sm6687270a91.16.2026.10.22.20.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:04:49 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: kvm@vger.kernel.org
Cc: Andrew Jones <andrew.jones@linux.dev>,
	kvm-riscv@lists.infradead.org,
	James Raphael Tiovalen <jamestiotio@gmail.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [kvm-unit-tests PATCH] riscv: sbi: Fix timer delay measurement race
Date: Fri, 23 Oct 2026 11:04:42 +0800
Message-Id: <20261023030442.3709880-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_200453_796978_D9E4CE45 
X-CRM114-Status: GOOD (  11.01  )
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

Record the counter at the start of timer_irq_handler() and use it to
calculate the elapsed time. Keep the loop timestamp for timeout detection.

Fixes: 14fa12b1351c ("riscv: sbi: Add test for timer extension")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 riscv/sbi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 3b8aadce..a298228b 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -245,6 +245,7 @@ struct timer_info {
 	bool timer_irq_set;
 	bool timer_irq_cleared;
 	unsigned long timer_irq_count;
+	unsigned long irq_cycles;
 };
 
 static struct timer_info timer_info;
@@ -256,6 +257,7 @@ static bool timer_irq_pending(void)
 
 static void timer_irq_handler(struct pt_regs *regs)
 {
+	timer_info.irq_cycles = timer_get_cycles();
 	timer_info.timer_works = true;
 
 	if (timer_info.timer_irq_count < ULONG_MAX)
@@ -304,7 +306,7 @@ static void timer_check_set_timer(bool mask_timer_irq)
 	}
 
 	if (timer_info.timer_works) {
-		duration = end - begin;
+		duration = timer_info.irq_cycles - begin;
 		report(duration >= d && duration <= (d + margin), "timer delay honored%s", mask_test_str);
 	}
 
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
