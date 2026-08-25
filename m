Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A444C61DB6
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzAD6/fegtHWZmGRGa4+CkTKdUoDugLYXQJqp5LbRus=; b=XKExkRiEQAbL0Y
	WdeIpW3r+red5ujETQI7ls8qY2XqTCE0TzajVT8eVOPJAm0XxpjMtNswQGe9zmCo12IwOe8uugOe6
	H8XVh0XtuOnc/IBjCvmvW6g6Tj/PFjkAbjB0hLAONWJWhSmVlJc2N3ucYXCnDdorfvpdsZ+fPYt2c
	boRqDw+HfW4imrdD8El2qmb0kzIDy/afFRQhaH7XzJcFGYPOQIxC40wvZN9ny5sumd3aVVeZbE27g
	i+PNzRKtjzTU7DTnqXspZhN8bSoJfeKibVN+5kRbzu6dMgZQM3Tm1STa2r1Y/3aSqMg0o01omEs3c
	OfVwKjwYuB48R8rxN3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfX-00000000P2b-11p3;
	Tue, 25 Aug 2026 08:38:07 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfL-00000000OvE-3Y66
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:38:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so5329114a12.2
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647075; x=1788251875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN2Jmy0Yce+ny/9mzHdZVPdF+NxcdzE2Ab9UDeAEcWs=;
        b=lw/HX3uKXRJmA8x+lzbR/xmOc5KGO9TtWDAyMv/VF4eXDBOChVDzJViEEXT+1t32XX
         BpVcb40Wgv7x82R3gSxQq4upQji561smm8/JDhItNIpAq+HUHl9mLFkaQoGC0lho8SFz
         DVd7bollszw0ut3UCzT32WH7W44p1YGhLsiKSiNi+EpkQTIAPID1JzzM1UH3T41c7E3B
         isiTO/ulPiOrPsLOFw86UWnzdWtsyzrVBMTTtro5HayM9Uu1rIWRfJA2BCv9vuWBS+XZ
         orqRdKT5K1G3vNkEULzb+qDoIZjJQrLJdjBmjNRZLpjZBbEOX/59U27dkXn/w+q98LNA
         FB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647075; x=1788251875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hN2Jmy0Yce+ny/9mzHdZVPdF+NxcdzE2Ab9UDeAEcWs=;
        b=Anfmrr8avQLGx1wN6U1YshmIQ/g8oRVVSRMO5dZGtn7eBanqaylJUc/bNb50GxFJ21
         yl1tv8RHzjQ0tmECu89oqnuqDj/Q6GWMGskgZgM3YIjGqrHRHt8g4PpMRSJx1YvGrce6
         +rONpBIkB0e93dG4SRvPQzEpUtLhuXAiFn5y6bBWwCdKQKujzQ7P5X2xQzEaMj9B5xHn
         VoFJNiixd/wrTXY0ugH/+yhP90mYDYPsmU7SP7dxJj+smpyEyCuqBQbUy0LpUG88W20X
         F4msqtEaa5nHQ43VJUdocyjpwq+yRdmQAa88c41aZ0FiGHqzEoyXWkrZEyFJkxrIdEk8
         P/UQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyfjbJA2y/vsI5X0selDAu6Ed+mi2h1EMOrioWGJoqyWpmqeUzvTcLbzWuEby78eniGmaZ6a8NgGE=@lists.infradead.org
X-Gm-Message-State: AFuF++nr8kN9hoePnjr2paTDgaHt1nBJdC/wyH+ygGZCqmy/ZnQlQui2
	fbkGuRiEz8e/PSgM9cbYGYFHG3CxMWcX2NPfpOa/Byn6aq7AODUJap2r
X-Gm-Gg: AR+sD12AdUoHwOzRBuDpGuKo9YEFft6GiOFqQz7bcDqJd9GumCAu+Tup3WQapUP+hAo
	AXpVbYVJba0mJXWvuM5JrO8ZphEzMZGImiUN1NVbep6WXa7M+QQnO70QQQaxutjIcXwCYszSd78
	nP6/L4+o1WNwT++zWaI6oHQjK8y9sT9NrOpd25G69h0lEYJBUS4yfd9S17LM8gsSXMHpjSATxnZ
	GSBZCds2w0nXtZFjW/Rs3fM+CCnH78epPLZliy1AFwzIaTMLOyAJ3z5IMBQBATgvKgtYss6SGeO
	YV+KqI7WMLx3VEJENEd2aYNJep/B6EPsP2YCAa8WPg4k6Yrsl1NPZM5uxsngUTqWFM9gdKbKtym
	ldumoLjcm2D8PI7TKDQCsQNZ1hCEFUMqNSU8NiRndBPFlMvYm/69GTIXw7fDS2DwmBozrkvHss2
	6rGtOk25zi71mLPu7pOPslGw4My+NFVFMgwMkJFfModZ8OWpioxOUH2KMlUW9+SbLWTlIS0duDL
	gVQoQqathTO
X-Received: by 2002:a05:6a20:c90c:b0:3cc:22bb:8911 with SMTP id adf61e73a8af0-3cd2fe7a2cdmr66070868637.6.1787647074852;
        Tue, 25 Aug 2026 01:37:54 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:54 -0700 (PDT)
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
Subject: [PATCH v1 3/3] RISC-V: KVM: Fix perf-backed counter accounting across stop and read
Date: Tue, 25 Aug 2026 17:37:19 +0900
Message-ID: <20260825083719.643970-4-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
References: <20260825083719.643970-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013755_886921_660D49FC 
X-CRM114-Status: GOOD (  15.81  )
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

pmu_ctr_read() adds the event count returned by perf_event_read_value()
to counter_val, which can accumulate the same count repeatedly across
reads. kvm_riscv_vcpu_pmu_ctr_stop() also leaves counter_val stale by
not folding the current event count into it.

Make reads of perf-backed counters side-effect free, and use
perf_event_pause() when stopping a counter to fold the current event
count into counter_val while resetting it. This preserves the counter
value across stop/start and lets the snapshot path use counter_val
directly.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 45dd5233340d..7d50490cc622 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -268,12 +268,13 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 			return -EINVAL;
 
 		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+		*out_val = pmc->counter_val;
 	} else if (pmc->perf_event) {
-		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
+		*out_val = pmc->counter_val +
+			   perf_event_read_value(pmc->perf_event, &enabled, &running);
 	} else {
 		return -EINVAL;
 	}
-	*out_val = pmc->counter_val;
 
 	return 0;
 }
@@ -641,7 +642,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	int i, pmc_index, sbiret = 0;
-	u64 enabled, running;
 	struct kvm_pmc *pmc;
 	int fevent_code;
 	bool snap_flag_set = flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
@@ -679,8 +679,11 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 			}
 		} else if (pmc->perf_event) {
 			if (pmc->started) {
-				/* Stop counting the counter */
-				perf_event_disable(pmc->perf_event);
+				/*
+				 * Stop the counter and fold the live count into counter_val.
+				 * Reset the event value to avoid redundant accumulation.
+				 */
+				pmc->counter_val += perf_event_pause(pmc->perf_event, true);
 				pmc->started = false;
 			} else {
 				sbiret = SBI_ERR_ALREADY_STOPPED;
@@ -694,9 +697,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 
 		if (snap_flag_set && !sbiret) {
-			if (pmc->perf_event)
-				pmc->counter_val += perf_event_read_value(pmc->perf_event,
-									  &enabled, &running);
 			/*
 			 * The counter and overflow indices in the snapshot region are w.r.to
 			 * cbase. Modify the set bit in the counter mask instead of the pmc_index
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
