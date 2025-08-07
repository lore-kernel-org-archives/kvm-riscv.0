Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D69C87FCF
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QHD34glgRjzsLWK0A4ogXUCyiGH9brAwCW2FEGDfh4=; b=IAdeBlvOZjAHDE
	gXGLWfX6TEzXRHXCvpqSr0IcuLg9RR7dVE5wgnC9mJXJSa9J5KGP79aDotaq7k+hJhe/hDTmYwnab
	swCBGisrs2Ky9rYLIIGZoO+/XmMgr0rKGJxCbe3g70PJUlf6keabZ3I4bTw+Z5BO3iraoMI4+ee+I
	G+Xkk12tANnsJYGM7gqyUoV6AKgnJ9EBQL9VJndJXoK7YVTa/YvYPpToiTJxaBVvsgt/6cITkCHrs
	+l6f/ZGOPfcGb70DCqvwWkBCLVv+rvrhiVMPYKnaiONhA+L1KgGc998NeeUmup10rn57tOY/MdOxe
	ooGBEa7H+qkOedlsbMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk26Z-00000000vI1-2pOz;
	Thu, 07 Aug 2025 15:00:31 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk25o-00000000ttC-2JdV;
	Thu, 07 Aug 2025 14:59:45 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso814847a12.3;
        Thu, 07 Aug 2025 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754578783; x=1755183583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gfuti96j1DWdp4sE/vCi6HTL8gGK7hRu0UOwmloMQdo=;
        b=jYTHK+AdYoVDCqtxq9lEjOIHkriulMJf60D/laOynKWMEO2XD9FiVbtP2EVDjE78Ao
         pTrf7Pl8xMWDLzYVdeZt/NNDdD+qpcCBOcCLzsW/DFVRVG1lKu57/+58l0K9mB6KI0fT
         PQMFsm9RRONm9ps9NFID72NAhAeE0Cy8dRcjsQ8wZOLNeEevwVpwqKzXxRVj/4P4o5P2
         CU6kk4hJNrkyn+wufxv+sz+mXNTPC847/iILt5VPmFj8tktetu/LK2t8wGb4eIL4fRXf
         l6XayJa2lbqokSBR61MNSfTJNcwELYvy7hu7to5y5vm8pgAxv/9B1nUKwQzFfkCVpy2n
         7xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578783; x=1755183583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gfuti96j1DWdp4sE/vCi6HTL8gGK7hRu0UOwmloMQdo=;
        b=ZWRFyeJbayVcc6bHskqVDImhcGv6NiVeHvPGiJjPFefa8PALe5uKlA/nyxFYLmDn/v
         Wzrfpnjoyd0vcRzgmSqv3tvsYOHkauO1IcfTgilXyOC06TaLvaqRkRZwo1ooPUuVr/Qb
         SMM0f/YUA2aDab5fELot6sD5m9mg1Vy5X2RPftvlF+RGrJqEx09bLwJq0N1Y66wtEx+K
         HdlaDjOR/SE7A65gg6p+Co0jLPHzk+ykesghp7NBPV6vJpDRVltprsPkwH5ZQZf59M3t
         nzjKnm0+y6FXiTpEM7SvClI9MG/IEaWO1JWj9Loa2Rzr1Tjrl9Yss0hIUXgt91wz60Gu
         PBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBKX3oH3ZbNRtJSm2WpbzF7lKZWlVBVkRzl5Zpao/CyoN+Hqo1FmgPC2rhOA4jT1P22G5G7EsJh9OACJw=@lists.infradead.org, AJvYcCVRQl0M4t/yJ7oKu4ghlgpN/vJ+mMOyk3NEBfV31tLObB7Ljuj3IfATv79I3awaM2vqTsDaPyTXzp0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfl/Y86OVzQmXLCiqkzEUvr2gylFK5ppi5cCQHvcv6RdHLU5YJ
	Ld4ULCE2SC2vdxGV+Xrq5M8HOJhegoyoS7wxEGIa6V8nstBbBD+m5Y8w
X-Gm-Gg: ASbGncurZYaNRG0YI7+YBuufJmuFN7cRNoFe9u7FmZccctvX8TA3fuasK0KYyJNSwQ0
	r1xPKdUCkwuvS09dCvMIz/JKckS/Bhp4DmF6OCRJbzbLpWulqdIsAn7BdVMsBpS6lyNIpIv6gop
	iRgNCAId9Vygc7dlbVotDywWh4v7hexP1BEYEUNstxO+UhuGsm7dRMmyeR9aEd1QdvBBOVUZnz1
	3rx/oNejOv/Mc+YqBcgmhKnMcHAiilQvqqVQv2IOCOgJD830PN1PXfcBFdFnKpV2Zom/pOapJEZ
	Lzmed7T2jTWOxUBQc4PaHTWijEPKT1a4irtt2RXDrHrnThLBDerpML7Y2uFwKrjVikiE5yo1Aw2
	f4q3uvRPecbiJYTP/KD6PQqQS9EgAxuoNKg==
X-Google-Smtp-Source: AGHT+IGPxQPuvHlgEiFt5T/XzMzu+ViboT+tVdh2HEe6EhYCrfjWstnNjANJfZY2GjcUT2QPBTC6DQ==
X-Received: by 2002:a17:903:b87:b0:240:3c64:8626 with SMTP id d9443c01a7336-2429ee6e786mr87749225ad.5.1754578783384;
        Thu, 07 Aug 2025 07:59:43 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([213.130.142.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm188254875ad.79.2025.08.07.07.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 07:59:42 -0700 (PDT)
From: dayss1224@gmail.com
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Dong Yang <dayss1224@gmail.com>
Subject: [PATCH v2 0/3] KVM: riscv: selftests: Enable supported test cases
Date: Thu,  7 Aug 2025 22:59:27 +0800
Message-Id: <cover.1754308799.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_075944_614300_A3BBD2EB 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Dong Yang <dayss1224@gmail.com>

Add supported KVM test cases and fix the compilation dependencies.
---
Changes in v2:
- Delete some repeat KVM test cases on riscv
- Add missing headers to fix the build for new RISC-V KVM selftests

Dong Yang (1):
  KVM: riscv: selftests: Add missing headers for new testcases

Quan Zhou (2):
  KVM: riscv: selftests: Add common supported test cases
  KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
    `rseq-riscv.h`

 tools/testing/selftests/kvm/Makefile.kvm              | 6 ++++++
 tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
 tools/testing/selftests/rseq/rseq-riscv.h             | 3 +--
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
