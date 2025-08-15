Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E3ECA0EDC
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B34RRRIqQ+XHpG9sjPEnHdAdsVLIyvMc23iA2HhXJsw=; b=bN4pimaPTWj59P
	8g1XpjL8XJ2lLwf5D5dbBCMOxSjHImxJgErQCP2ds2fEbRLHVB6DaLwNXYdSZelSEqZ2xhXSGof0D
	18PJlIciJ6guEFdh7I+d+1wOHTpFrDB7DNIIbwtEw1qantPCrtXk5AXeOVIqsjx5hfbtd35VVOmaR
	/Bku5QDC07W7YbhdkMrE44hXq6uKGtDE9hZs+Oeng3Z18Hzbg6Z0EnSaH6pRNASwBur2FBptnB6iE
	eudYUwJY4AYepYEXVAJNmrY6d1iXkXkZMDUl104prH/IiC0ysjXHvk/5c7Kf43+CaEqMTDVoi90QO
	Po1ilS30Wu2L6vxXQ3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiun-000000010FA-1vGT;
	Fri, 15 Aug 2025 01:07:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiBC-00000000sU5-16mi;
	Fri, 15 Aug 2025 00:20:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-244581c3b43so13793475ad.2;
        Thu, 14 Aug 2025 17:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217221; x=1755822021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnAqP/Eao4gbLB1mbZYWMwk5AegHaMBnl9yzD4tj3Pc=;
        b=JVVRlszg5sZuTw9mlJW77Y4K5kpnXhzD5bAwcGX5DqvkU9wCSb1Oin5s4Z3iul7u7j
         S34LUiMh8IJoQ9Ys6RAhh4tnKfD2Xcgx8mueBef5WHIAQuwYTl3Sz2s9tBFh9jv9oRWH
         bZIN9GwN9hf/bUKk2wajic7BgwmZG/oL4L94bsdwZm2a1UCKFlBynPCe9jX9Bj9lSMwi
         v/Y2GKq3AN8CBkAObZ4ujZM/ZJ+elSdG8qfllvhXWjInNZASoSEYqwL5VdmQNx0uHX0y
         ji+FLdtcv6E8kpusPJMEN2z3cRoHnSI10hwPG+9sHSBn9fRVleOgSufvAVO3hqlv9dw6
         JQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217221; x=1755822021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnAqP/Eao4gbLB1mbZYWMwk5AegHaMBnl9yzD4tj3Pc=;
        b=HIjBxpTbCifXMhW+lAyRZ6xx2pbuMmmSUCQXu3VVdwPyuAFR9ota5e44YbSnQpWrjK
         l8WniOkAzGG3X3QdZZHBauoy6FvtB7qVs82tGxbsCBaOf0HKH9l20pMJBnQYKptyN0Oc
         hwV8314IBFBzKAyzQFYS7wj0QzeYd3Y8LWeQo0AT1bt/A7Od38bKkGwv6OuqFCietx87
         vyXYlcnK6s4LgOpGvyf7SrRKvzh73KlmgDEKNmnaSaMQEJp/FH8YyrQcCX+n/z00e2KW
         kUlzNbEWurSzn7K+I28x8AZTmvlBdAm15hnEElhHoX7HWE0OJ/80Ohzkamp3hbjBqh3A
         KT+g==
X-Forwarded-Encrypted: i=1; AJvYcCUlaKn+BSzS7tj5mdcdnB2C5aal73MRYRgdrPlAGOOhVktou+2LGjOdLsmugcs9kgFsosohbnjFu4FarEE=@lists.infradead.org, AJvYcCV5bJ2M3jclWA23TSnJkBEJpBIQWVWlLBl0KeMY3qDv418TWSPq2SiOCNNCpt4b7TDpbS8TUUSvcrI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLS1iLBYLZR/+ss3gJ5gM5g3OkAATkgWzouJmCoj9p1dTaOHf
	TWjHanu4KNZD8lhHGA8oMlsKpQSh4FKxAsyO1UamLpzfjfXRfHBQaOYa
X-Gm-Gg: ASbGnctd7ybW6WlP4pCz1F8f//IUji7DGw0u4x+KkRxCMw3/eECzrfg2LEH9TBNb7X0
	t82N1gdzVKVjm54Yf7k1vNC/DR+liwihkamVoRPFVueF1VEsG8Y4eXQKDn6RiuLHCJhl6Q4NiRJ
	EaskGm5VxOE/ekcaaxwVvMOMHDowf0lK380LYSiLa2Hk5Nj/zvm2xpd5r2IQvc98RtWd9WRfvut
	yICtYHTKrouXJcglvZ5EDcF1YjL6EwHwVD2a9J7huznHWqOfpI5Em4giTYMrvMQ5L6mnt19gH4c
	gIrt47O/LLZEPmpH5t4mjUmYOACXoJ5lj2k08bh4AwwwLCaEf9gNeWvTc4Vf8dZHjmJZZR8DEMN
	/tkrKGFm1tO3cmkCXBkFgU1XHM+5cpgJY+17ZSoSPjQ==
X-Google-Smtp-Source: AGHT+IFCAtu5B5yxPJm9Jf0dqxrJjQRchll+v2TqA1NF0cIniaNtFVRw/nJJfo96v0jQVWxXrvFqKw==
X-Received: by 2002:a17:903:46c4:b0:243:6d9:aa2e with SMTP id d9443c01a7336-2446d9b0973mr1513905ad.53.1755217221031;
        Thu, 14 Aug 2025 17:20:21 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a451esm700745ad.165.2025.08.14.17.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:20:20 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/6] selftests: kvm: riscv: fix spelling mistakes in comments
Date: Fri, 15 Aug 2025 05:48:01 +0530
Message-Id: <20250815001803.112924-3-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815001803.112924-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_172022_300145_A28CC701 
X-CRM114-Status: GOOD (  11.24  )
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

found/fixed the following typos

- indicies -> indices
- requrired -> required
- guranteed -> guaranteed

in `tools/testing/selftests/kvm/riscv/sbi_pmu_test.c`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 924a335d2262..6a8818ac036c 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -212,7 +212,7 @@ static void update_counter_info(int num_counters)
 	for (i = 0; i < num_counters; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 
-		/* There can be gaps in logical counter indicies*/
+		/* There can be gaps in logical counter indices*/
 		if (ret.error)
 			continue;
 		GUEST_ASSERT_NE(ret.value, 0);
@@ -446,7 +446,7 @@ static void test_pmu_basic_sanity(void)
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
 				0, 0, 0, 0, 0);
 
-		/* There can be gaps in logical counter indicies*/
+		/* There can be gaps in logical counter indices*/
 		if (ret.error)
 			continue;
 		GUEST_ASSERT_NE(ret.value, 0);
@@ -474,7 +474,7 @@ static void test_pmu_events_snaphost(void)
 	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
 	int i;
 
-	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	/* Verify presence of SBI PMU and minimum required SBI version */
 	verify_sbi_requirement_assert();
 
 	snapshot_set_shmem(snapshot_gpa, 0);
@@ -489,7 +489,7 @@ static void test_pmu_events_snaphost(void)
 		if (counter_mask_available & (BIT(i)))
 			GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_values[i]), 0);
 	}
-	/* Only these two events are guranteed to be present */
+	/* Only these two events are guaranteed to be present */
 	test_pmu_event_snapshot(SBI_PMU_HW_CPU_CYCLES);
 	test_pmu_event_snapshot(SBI_PMU_HW_INSTRUCTIONS);
 
@@ -500,7 +500,7 @@ static void test_pmu_events_overflow(void)
 {
 	int num_counters = 0, i = 0;
 
-	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	/* Verify presence of SBI PMU and minimum required SBI version */
 	verify_sbi_requirement_assert();
 
 	snapshot_set_shmem(snapshot_gpa, 0);
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
