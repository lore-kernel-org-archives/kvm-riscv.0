Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08487C61DBC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bq1+GsBJUm+wqEtVV3FP7In+5gEd4Vf2PbuBBQAAOG0=; b=ryBbga63lQ18bG
	mqrVoQQsrY4MhRH3KEUIV+sOhybWOgv1qqgr1VeC/gcBF6G3Fj1Q4Sl6yWUQDJlyCisMt6TNJGvEF
	0qSrc+XKpLWf+GVN/6Z0JBMWweuQPUKwVOXZ9yRLpUBdPf5wRIASUKkD0tNmufcnv6K3ItPUX/NqI
	pjXRxyfUGQbxFgGyMwInQrRQME1c1AHj0qFQG7gNHKmUEfZGsLPu7OlrqNVFegrlwt8CNFqVnLgbd
	Z9hmhncuvjOU1rrYVwmGMmyhwP5jriCJGUUNnlZfIpagd2nS00CvG6ErpMOz9x+cyDOGwz1G8y35o
	JsgS7+BGDDxbK7HWMs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfD-00000000Oqc-2nvI;
	Tue, 25 Aug 2026 08:37:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfB-00000000OpD-23br
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:37:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3717752a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647065; x=1788251865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKUnc+hCH/m96lQyJ3IHIfrh5f9TDgQ6D60NAJmR+nI=;
        b=B5IWOJp4Pe0JNFAJMiTgCXoVhZEjzTRJbff4dvRp7YaNhmfOMbb3aUV6rZrq4Oi5/c
         2ioe5hiHzIbWRXSl41xinBLRXdWtrioD1ALJjTEfvv37cxq0GwEf5PGJiqWeTaFtOFL0
         4Op/Z5aCMPHvS6aM1SOKywW9mcX3iPun3RTMDwYtUUInjligz9H6OhCWR5hXNse4MqqV
         1wYcwAvHiE9RQxD8I5xLiU3AIp2wXIk9+IgXmxGPYAW1GPifhDf+4tw4u8SsPzcefLy5
         ydgMHrMCMX6omuqoKQ7o01NNHlN0NktceM1RsPHzxmSNKJQo7iTHGqjoIHoxNP6dJDFi
         4qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647065; x=1788251865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKUnc+hCH/m96lQyJ3IHIfrh5f9TDgQ6D60NAJmR+nI=;
        b=k8X6bwDDwpLaXo6zaXaGb4Oh8HkbOHMS9PC/psUG/QvxMB/D7tfgEkN7OkyJZbAbDJ
         mRjs/OJiaI/Vnn1pZXHpG6ZfOrpjgmMQdSi2WG9jyMNw618B/7QCwBLPUEjs4cGx6Of+
         7Ym+L3Wnu6X1FeNI7zH8M+7bunO8iZYezkEae3uOHZ2iJC2dghZfcj1j2vmQ7rpaPq+E
         pAO9cU5G6Rjzek2y9ZrJ9oWs8pDCLe633/HFNSNJjKl13yanpxWd6gCdqd7vwZUS46SN
         dILgvHLmVcpoPSD4W7hpy6JMVitGVtSs7ZrCEM14LI46HKX7tWnSQfYuD2l26F0Lhbod
         yhpg==
X-Forwarded-Encrypted: i=1; AHgh+Rpmh084zgipLn1lWEy6opHg/cH80ZI9MnTg6dbCGJDvXKkqUasxjoTAcVOdDElr5d1U1cVEKESAfXE=@lists.infradead.org
X-Gm-Message-State: AFuF++ldnmHt6BIGWPna5EtZ852dN0OT9iJ1j5nPwAYuJsZdS0uAzRnF
	WRc99SRfS3SBO/8IGYC5SP9ZgeazJcxFWdNy98dEnDdoTEa8LbwRLX9w
X-Gm-Gg: AR+sD105EN17/CsuzLTOgtsPH88WP4MT5gyiSHeY6nVAPefobxjRdV3+lLbysUzkLsy
	d+2/y0P8IYU3/6Gw5kCvfzx+wu59uzTgnNTa+SxC/4KtlrKnDJVXH+hgvqlfJkayiQwmz9cMyRX
	J5PaCimnbzUgS1WtkzeEoGSzplLMuHkETPGCFmo5V+e3TSXTWp3Onk9hFrmuGHAHfkF9FMZARki
	jeGlIHx1G0vIkq7VBy7lirQ8urx2m65w6fkDT8O3Z9MHD9tJg40X4Rd9sJTMJ8qy+9kQh3u3yRG
	CKtgZuVYNdx6bByPJ+7/O7gEzTpHIY19gFlNeo6JSIc1W9wIB3SQG9v2wPZRFVrtXblNFstpZ8T
	j2ViyYxnwNm5UkL8IAi0J/LMuwwND1oWz5SEEVLBi2nKVAYjJ6NSidIcmHmWwjI4nBUgLnwFvjW
	3nNpBEnsp6T+42cnJcNi4wzCils8Ex6Isf8LySpN6mz2a2glzrgyCTOn60HLYMyUhUY3WOz8gHv
	lLrjNc+xdOj
X-Received: by 2002:a05:6a20:6f04:b0:3c4:1916:9d3c with SMTP id adf61e73a8af0-3cd301428ecmr16874917637.15.1787647064570;
        Tue, 25 Aug 2026 01:37:44 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:44 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 1/3] RISC-V: KVM: Preserve firmware counter value across stop/start
Date: Tue, 25 Aug 2026 17:37:17 +0900
Message-ID: <20260825083719.643970-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
References: <20260825083719.643970-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013745_536049_11CABCB5 
X-CRM114-Status: GOOD (  12.45  )
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

Firmware events accumulate in kvpmu->fw_event[].value while running,
but counter stop only clears fw_event[].started without saving the
value back to pmc->counter_val. A subsequent counter start without
SBI_PMU_START_FLAG_SET_INIT_VALUE reloads the stale counter_val into
fw_event[].value, losing all events counted so far.

Save fw_event[].value into counter_val when actually stopping a
running counter, and remove the now redundant synchronization from
the snapshot path.

Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2025b664961c..56dd5b1b2846 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -671,10 +671,12 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				goto out;
 			}
 
-			if (!kvpmu->fw_event[fevent_code].started)
+			if (!kvpmu->fw_event[fevent_code].started) {
 				sbiret = SBI_ERR_ALREADY_STOPPED;
-
-			kvpmu->fw_event[fevent_code].started = false;
+			} else {
+				kvpmu->fw_event[fevent_code].started = false;
+				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+			}
 		} else if (pmc->perf_event) {
 			if (pmc->started) {
 				/* Stop counting the counter */
@@ -692,9 +694,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 
 		if (snap_flag_set && !sbiret) {
-			if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW)
-				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
-			else if (pmc->perf_event)
+			if (pmc->perf_event)
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
 			/*
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
