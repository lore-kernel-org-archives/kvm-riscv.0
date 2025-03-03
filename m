Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0E1C282D2
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEAi7W+ui41k6rn4A0JOMfQ/DjPg1Hxyqed7lZjiJV8=; b=3T0+QVU2ghxBeN
	Md5NRgX94WOFzItkjteHZz07QC2gPspBXPVnj7rsVdB4C7RY70hsCjk51Tuih1zq45KTFXnq87ImY
	0CCzrGiu0IqvlJ2g7CsduAD0TfMirkBQFn4x+RNmHiZtKMidlMHiUVQ16WvogswsJKCWwdg7sqnHN
	puO71EMt/EyDzK1RQWVRVDnF4ZklSEhZuMCN2R9/0VXwwdv7KFmXHXfRm0suenCIOkj/qb3dWURuF
	+NclN04FoDMrfXkniOpc9MqmDdK6yHl230mS6fcIM4Ha6kDHE6nzQQT6sRdaNYHlfem6cSj5t3Lc6
	l6gYZxTrGtI8LaHi4qbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEez-00000002VzG-0rAh;
	Mon, 03 Mar 2025 22:53:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEev-00000002Vw7-3UQE
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2234e4b079cso90571315ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042393; x=1741647193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mugBhowmjHeOZ8voD78niLPk8kFDSWBL6lZCl8cn1Qg=;
        b=ch3ccgSJtvNry+ip5X0qGjeYI5gMZ7V5/KXNQmr9PTahLbHlH72IfJJAgNQLyiNAFt
         BUNJjBUADoXqozPgKSAro5qBkXO5kMpEvV631lWcPb9yqPh9lShILqWxXMJi2PgG4lTp
         1lTNcj/LKoujmFSZbrhVGsy6h+w2+Is8Y0jgv6O/2F3XHZTKCCpGErvhb/55xNsJU62k
         N5nXCHCywbfGZvNosyTVCX3zK9SFBw2jet0u+/o6BN4VNb6G8Mp7cfjpoP4T2SuFkGI+
         +TIFepY4cydDDbHRzYVxe/m9TWUEgx1EzADTGlZO7+HQPOKYVW7VxDVhH8irLSyun0V0
         dkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042393; x=1741647193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mugBhowmjHeOZ8voD78niLPk8kFDSWBL6lZCl8cn1Qg=;
        b=MuhOyPvkNjV72Qa0jHp1llGdO6e2GwaS9PKGK/wZP4p7KrjRJDiiFGwGw+o7DhpRuw
         caWycoODYQPnXdmMPJqAIdrgPbKcHaNdMeG96vYcqD+p9Pu7f8mmRzOYlCKFUzBt7l+E
         NgFPhvaKIm7I4D6DkfhbXPsQQByytPtoctGWR0cjFbbaRLtZU4j958/LW4SVr6kLK146
         akc7LIRSLsG7/G3B63WLHSkX8pNqonPsYfLS9LAmqy4Z/nR9BzTeak0xd4is1qbXlxJt
         3xoRvE3LxOWTrUQ//SVPCj+pX7+8mtQsxqAIwGlFRoUQaxi8YmOvUO2OTH864dX4ZzjL
         kSJA==
X-Forwarded-Encrypted: i=1; AJvYcCWiIIBa4dW4/LYFut6tvGLOpqL0rMxD1y2F7v9q4KPHX40j3J1ji8YqzEtzYDjN9vG2v5jbAbGE3Uk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi7hktHHBEZVou6kCxaBzZLrDI6nI6uzdTRmn71AZXHoGAqwZF
	nine1+eWyi7OI0BeSWzgEIPQY05C5IUD75oSOtKk0MEY9/xmtZhBWJH+zopPC8hCeEu88+j/KuW
	F
X-Gm-Gg: ASbGncvrlb2sv7xavWQkxcxjJnOxnQJgPgKnkr5e+Wg6ryreHmUXoRnn1ErlStXTXyJ
	8mvcSKNt+EdqT5SM+TXgr6eU+c8wJhhMTPsbipxxhL5IQffU1NVuWVYABmkJVL07xw+bvwCzL8W
	xtJM2zZDxQ5XO2UaUcAHeHyET4XGYeHj4TpVDFnTW7yzKZh+tzWHhhb4X6XEJInXJYf4haHYiCw
	cgcCC+K9TxbHzDX/VhMm+HFxyaGKyt9nauFfHB6M0HVsTo3sli48a9MRa1VLO7/eVTbrRbWU2jW
	yORjpHrx9WoL2tCAa+jINjGvPPWBv9Jv3cY1CZTOaoeLsF43w900ckbceQ==
X-Google-Smtp-Source: AGHT+IGcN7KmSzWUc3x2Q9hIKcCxmrhzor1ESo6ey42ZNpnLuX0uKU0+qCp3SXFy7hHj8nlBIEN6rA==
X-Received: by 2002:a05:6a00:240c:b0:732:2170:b68b with SMTP id d2e1a72fcca58-734abee4a68mr22681643b3a.0.1741042393072;
        Mon, 03 Mar 2025 14:53:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:12 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:06 -0800
Subject: [PATCH v2 1/4] RISC-V: KVM: Disable the kernel perf counter during
 configure
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-1-41d177e45929@rivosinc.com>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145313_864739_1C377E86 
X-CRM114-Status: UNSURE (   9.50  )
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

The perf event should be marked disabled during the creation as
it is not ready to be scheduled until there is SBI PMU start call
or config matching is called with auto start. Otherwise, event add/start
gets called during perf_event_create_kernel_counter function.
It will be enabled and scheduled to run via perf_event_enable during
either the above mentioned scenario.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..78ac3216a54d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -666,6 +666,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 		.type = etype,
 		.size = sizeof(struct perf_event_attr),
 		.pinned = true,
+		.disabled = true,
 		/*
 		 * It should never reach here if the platform doesn't support the sscofpmf
 		 * extension as mode filtering won't work without it.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
