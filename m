Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC2EFC617D
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65bCIPVBTz4nu1vT6J2hSjfY4Fj1xF9zyTdNREZnR5A=; b=tsbvhMPqwABFlg
	vt9OcsD/s9sevrMu5cpJBOpn4UVyzLEETuctja7Yf4lVdisTwTjSIP/hiExcDwkYgva/P36DikqeO
	GE1ZxrwZh6u/nCoHMRPOceXPp9t4jgu/CKHBtziFmFe1aZYwsLnVAl5rMZYLrbazUktwFxjnQ+c01
	wsrJu8d3wpyU+gOcda9TD5XOx3GtM1oEIUJPmIAdGZ685Jo9SiCVFrAbivZJmaFhSE3dcsr2MeeMA
	4PITFx2rRUQrx7yYi+sufrGVtuaegRVyVFuo93HFSOmUuZ0A5ddQqpc+aYSj8As/OdJ87NRqS4BZH
	CiJul+/4fFI+jfOJ67mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDD-00000009A9E-0AId;
	Sat, 03 Jan 2026 09:46:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyD6-00000009A70-0Rrh
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso130542705ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433571; x=1768038371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QD8Sx/RaT2/O/5gLvBejwmV75tu/ja0fKa+EuiTHipM=;
        b=DHP3gCoEe75QKmCRXXaTBTh3o+ErwACHS1OoIKoac2Hv+XHZ4/S5/Gnqjl0nEQd8lo
         BVZilmUgx325ZghRfamCgtpLlbESvieYkScmfCSYcfhHF0qMJfeFmhGTdVg9q/W8zipf
         uOmpTIyNY1ozjbcrAAWLH4XmyyFsO4DxbGF10yKS7s1BkU9qUEouq0lokfaHYDn8XoKc
         Vk17u3avu3z8GAGUi7JujLXd1ykiFT6IoD6eNhU4rZGVUPtYVbu2DeIJm3cyafHtZ3co
         1DtCm+BqRx1ZKRCf07X9iYAzapeF5mxoqNxIf5FstflQn6Su7N9BoTnOiMLNUbs7OCkd
         /8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433571; x=1768038371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QD8Sx/RaT2/O/5gLvBejwmV75tu/ja0fKa+EuiTHipM=;
        b=rCawYX41hmZbSWDcyWw9DmMNp5TtC1WH+kV9JYWikNEjCR7TkY2QCdKmQwQniAnxkg
         NIfZ9g3bino9orO0VQwJvksT6nuW6OTNTmRkRS/DHEgmMbNmM72d+f8m3js5HP2S4UeN
         RF8AN+AltwLYFTtj73gHdxShM2paEWBjf8ZoDpU6NF1sWGTPDPncrVdLGzreFBWdzm4X
         puKH4OD+6VHgxCUn3C3ar+xm74nRUbRJap/m6bi9oRisB/pCgrD2PVJxbRGAs69T2a2I
         C2xyWVuynJEVfzILmKcA58qylzMyq4mQsYTvnEHLeFM4WB+86OEaPBkYeHcRGShyVRmJ
         iv6w==
X-Forwarded-Encrypted: i=1; AJvYcCVtMW/OIWzFimP8Gfx8KIIZQ/i+A5X0ERJ+DCzX582Frdmy9RG1UdgJbqYwqFHNiYglF5aTRRPiqkk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBI3wJy6OpXojc34kIOXHUccOjt4SomGlfijfDLcxsb2Jw4yth
	lqZWfYwOm5mgn+0tRGbngJcswmiI1kN8BRJTaSdbtEYYvHapJI0OSVAD
X-Gm-Gg: AY/fxX6noRAKWPIa1VCsUZiZbP42T307wzCi7hPJJeNOOW6lmvzaPpfcL1toRfNff+Y
	7QaJZ4PRX8DSC8ukx5ZCncaGu/vBrpuZSfmzUdeJB3PVbHA15d2vDU86NLaOnGQr/r9ziZ4ogf/
	IdOJlsKJgKnImkJsURnH75K0sRnxo3pNqsJ67BtXUHEOHMgKy44a0H/5RSCnJwUJzP8WRAIDAIt
	PTyiqQdJnekyNzwTx4R+EnCqYhQrkcpvC8OOe4JZVfBoSbFEIFPMJ7zkds7ZjXpAo9U4D/Zv2lN
	qrudryF68jRdDnUZ3gn8Fps+YD0priLns7IRbwNX6F8+cAhJXKXO8RKWtPSllgnPbPC4SK9jO2Q
	xgZLh4ckNSYcGSYm2n8zW3nkFaz67A/qYBUAkPDwLNTYcLwlt1LIrwj/71GzuYtdE75l9YK69q1
	lggCYAqkD9Pk/z+h6RItDT6d/7BEJPf7xZnKP9yP33GH1Gbwgs/C9o9QUeo5vWYb0q
X-Google-Smtp-Source: AGHT+IFZ9sPizMNM+JWU3KI5MPEz2Gf+WxarNuEkzY+cxzhhI3PlvMK1ckXi0qC5e1Tf6i9ocvTvEA==
X-Received: by 2002:a17:902:f68a:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a2f2836964mr436023025ad.36.1767433571215;
        Sat, 03 Jan 2026 01:46:11 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:10 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
Date: Sat,  3 Jan 2026 18:44:59 +0900
Message-Id: <20260103094501.5625-2-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014612_201544_1F8269DB 
X-CRM114-Status: UNSURE (   8.21  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4d7cf338824a..cfc4d83c42c0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -50,8 +50,9 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 #else
 		csr_write(CSR_STIMECMP, next_tval);
 #endif
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
