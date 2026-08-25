Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71466C5DF94
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qo8BjdoUUK0Gvq0QiNTf07p42ySnftFv6isv5yJTjdY=; b=ZzJze0VRoazpPM
	dcDV+bcA3VueSTta3ThT1n4eKwndTAo6HBQb8x4XaOAiyRhk1r5hhHc8QhAVOTyKgVbruac/uo044
	h6KMZ0/rnWYRYN9OAW1dreMf/8HBOC7ZFiSqGhyjgx1K/l3lMNuKXN8EUIOS1d1tXjk7mk0sg/a8O
	V74ecqoe1StOUL/cOTxAA+HwIk6fyt0x1uAqtRV1DlWfIhYoMD1+2II9+FCweUIjQLVK9Zgk2j64q
	+WjjRoCIsv99Q4barSwmSFUZgh2pFqcX5iKzXDe7mNWUBxXkQhCOxZwhiT6k46VGWR9lvEieOdh52
	HkV6MVABgn0w0NZKDCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfI-00000000OtL-3sfl;
	Tue, 25 Aug 2026 08:37:53 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymfG-00000000Orw-3vYm
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:37:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so1646767a12.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647070; x=1788251870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlP9O0s11C5YW6Wj3Uolvqko6ksI3Exocfu05SFa8SI=;
        b=IvMZy+H60TyTglyt/evcUd4nhrPKIhYZutDasJuflz1uPWWV6z/9+bkXQNm3zVasjd
         NNLPj9zM6wJ95BQpW0Gb9ohYruDCkF0BI6RE4LapoUx7/V8vTsb4trADxQ0/vUDFwoIq
         dIk1HlOLL2Y6tTAP6rws10GA21V4aUucgBzUCAggIEw8Oi8jVwXUjYFAH+mcAT+J/1yR
         rUAtJRS9mOLjsOUOPKLUmx/Oe2CuVsJFwYsGcQYsQY6aQOPrlvIr1Y9w207ERrKWAH/4
         a8PyFgquB0sjDkBPBr8PX540p/Q6m+LMAb4sT2sLeTyn+MTpzdFlFg8gq87RYnJH87Nd
         Md3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647070; x=1788251870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlP9O0s11C5YW6Wj3Uolvqko6ksI3Exocfu05SFa8SI=;
        b=Ub7QhNM0SXTr5YBjUffenCDA8AJF657poH3MZ7WRXqkjLEt98GzsHWv/CiGalxVcvy
         lwDoxRBrlJ8b/fr/p3JTIuP/KU8FG6fsnJuDxuMM1LcOh5FMSrgeLyK4dFgPudYdy+IU
         xUqZG/wuZ6NRtqjbTHjgAQf8UjwmhGC0TiiLahoq8zblgKzKYW3ErUsdl1dgkc0nP7AY
         naC2m+1VGvDCJCOevRjPXF2q+atl5V/SFDTmWndKcRtN0l33RxWFS022YvulLkNlG1uo
         filZCsSmmXokmo57SAqd4nf2mRRUFft734scGBSmC7iQTaumF5ssPgrePN6zO4F2jyGK
         iMPA==
X-Forwarded-Encrypted: i=1; AHgh+RrhgSvdkYfJnTpYQq+DLH9nCo0B9qNyK5QoGjGAYUq+2K1wuWS12+EHxANJfN3U4hTOm620KTv3ulo=@lists.infradead.org
X-Gm-Message-State: AFuF++m6fniWeNYgJrBONAmkon/BK6VIWDXM0wk78oA+kY22HmLTKi8j
	bjkOujBQ0Xw9wdwsB4TPiqU3qzTWwbhqsSFXrFygh2BtVl6aiQI7T62C
X-Gm-Gg: AR+sD11is226WQWmR8ITycYReXXhmt9oO6jEa9lQ/RNwME+I7ioA0VXpGrlDRiTVFEi
	Q/zpa7jbaiaowAUYp/XJm/zBMtJjZ017CZXiSRfTOsr7HzZOTiqZPJay9sbw8vHoXMSvek9BStq
	1IZl9l9Vw+Ork2p1Wj46KjyArePKSX5S+ty/g7PHjqXVZS7/wgXdBXQGG1D1FDWXZpWJVbzJ5wZ
	DeaWHSXNnVZ7dFBbueK7qP6dW5CmOmmT61OJ8QHFpLlECf6s7RIQQdJNckwneWz+dTt2d9XUhxX
	F9VDAwvrMJ96q3qpr6bjXHFG8VkOOg8ogJtG6T+7bl8tpYseNs0/ZKeNv7YVJ6709gTgEXfMFWs
	cvdZMZDfrfSnqzQkIyupdoxvByI2rHYhamYy6HCpMzZqsz2nVVbHeYfve9ViiSt18lSc13gU+o8
	KWJdWreZwefnzCYT2XZ/gfq7SOv+AYmnei7iYFxsVtJ9X5rCIek816p5d6T4oQ26zpQVfhafiad
	x8cAACwKFXA
X-Received: by 2002:a05:6300:6bc7:20b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3cd9f9933bamr400900637.0.1787647069755;
        Tue, 25 Aug 2026 01:37:49 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:48 -0700 (PDT)
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
Subject: [PATCH v1 2/3] RISC-V: KVM: Report snapshot write failure to the guest
Date: Tue, 25 Aug 2026 17:37:18 +0900
Message-ID: <20260825083719.643970-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
References: <20260825083719.643970-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013750_972949_C1A22045 
X-CRM114-Status: UNSURE (   9.53  )
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

If kvm_vcpu_write_guest() fails while updating the PMU snapshot area
on counter stop, the guest may receive SBI_SUCCESS without the
snapshot being updated, leaving stale data in shared memory.

Return SBI_ERR_FAILURE when the snapshot write fails.

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 56dd5b1b2846..45dd5233340d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -723,9 +723,10 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 	}
 
-	if (shmem_needs_update)
-		kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
-					     sizeof(struct riscv_pmu_snapshot_data));
+	if (shmem_needs_update &&
+	    kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+				 sizeof(struct riscv_pmu_snapshot_data)))
+		sbiret = SBI_ERR_FAILURE;
 
 out:
 	retdata->err_val = sbiret;
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
