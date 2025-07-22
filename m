Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D3C83F1A
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJysyysaNxB/8Qnyp8fCX3IKhOK5wlRPCnR/7p6DvX0=; b=0bKxZDXXS1b2ae
	8vmADwl65ZEVdWABOG09SdtWNa7rVC9qtroR5uA9c+faOwXxkcvsVClF4NnQqHKd1yDWaVmpJgkzm
	DvFA3lT00qzPT4NDxiOufghP6q9W2QjVkTvvZcUFEPNeuFDMNsIEVsD/3Bxh7zTqFj0gH4a9sl9KI
	IF2eE2xfV+aM6VGdKRXLAIax6JUTaK/fygopZZI0Rqk+qdtnezcL/v7hj36SIdmaQfioS0F8M1eqS
	gmgaHilNNejsUT9hMRKyz4zYkJtr94QsbVLZMRaKIlo8sVe6aq3l+5RkP3zrFhSgAu08+FVPC5TPt
	AYUs1twM4MmjEx0viANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3YT-00000001A4r-3H9u;
	Tue, 22 Jul 2025 03:20:37 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TT-0000000193p-0dwx
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:29 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so5082920a12.3
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154126; x=1753758926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=fooP1swjwOSmtVGGDiKs6DY0oSLNPKjhw89u6B67jH+kk6+pOZnmI+9M/1hJglc+tE
         DC8duauvhWd+THnmpSDzjU8SqIGih7ABuntZORs3tnHQBKT0e+UGJkTe9FXDy4UuSU24
         IPTIc7xpppx/Wmn2iDAKJY7rwv1mhi9N6R58qp0oWz3Kvyq6hmfmWe1Iboy9WujVhYH6
         fvnjzFR42qDu3I0L8LCki7I31k1AYa54WjhBw3OVR3AWWv3fEIA68mAPh7MEeew0keOK
         pxNa0kO+i1po/fe13sqtNsuPzSOrFhUYJdl1A+Dmj6oeOlMvF5l+TTYkWvZ4Qfi+AESN
         BcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154126; x=1753758926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=Pn1LUoCArQkKzgQssDPYYR25TUCubKa4P8HecTUtPjSdLMRRrvvjz/Xcoxydra5bob
         /u4ODd6mBZdRRnn/dFx+Ux0zaxyznv10e0NVKJ6EXOUcnMFpZt3yxpWP9230SpNPmYxU
         i2AhMKpuK03Q6KfIZLb/Iua20Ng8Y2xIfv4oYmYXaxqEJK3X9wZnixQtngHMlSZTreOr
         cO2hHQENoWi6JaBX75lenAer502GEz9hi60Ka/biBLjG1bJt7qGfX7UKx9wynz4I/2m0
         QWqzxv4waHkvt/pCYx8j9eHoy5pQr9TOw1LJ7Crbd1rz6hG/aIgSXeMug1htB19W6Czv
         SZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQdZZUZHjtz1+++a+Z7GAhmP+sB3+a/avbnqpM8aE/D+6INTrpt3N/HQJ0nVVkCn0H9RCHXtcJUaY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAIl22fB8i/MeASpwzx1U6JrdHHtOqDC82PBqLXbv7WigdJMdT
	lD9sGkJaoADvPDtgW5XbAiBppfXJ6uMHXjVzGruoGh0rafCWcxOfjpdazY914OnoPrI=
X-Gm-Gg: ASbGnctcCVF/5zagssrImYVp/e/FGRX1Ki/7FB73ncz2O7TLa1Qi8Z9IivTxLovc/uk
	g791DuQ5LVcCQkqrvRrnqo6ZL3Nurmly/ANtoRNlV2w8il7VZ1BzjSCG/OiCYzN7OajEO49lOoL
	YUy723xEBBQALu6FDs6WPDygEGy997bjXbeP9muUxoDoNZtEZHxJ68aobndiXfWs6AW2izPhmAn
	f8yFRtBLOOA+VLDjydUqJDSPoIgFH0q0E4L3ZvRHlwufGOxA5y7QPeonH/lih/0XW51i3PtAdBN
	YulCBRlAzDY5WzWr+T1pu2dze40QSaDvn1qT0H7CFAJPL16bElBbe8rb3iReciu7/aF2OUuJi02
	avx2XtcbaZ2RJkwkabVCIJIFylx4dkptXYk8=
X-Google-Smtp-Source: AGHT+IFGWxj3iUKxSSdZKPT9lOfiDcRTnkWskcnNV9b0jBWk2yItlB0Jg7U1GDfAal+i2ahxkqkLKQ==
X-Received: by 2002:a05:6a21:6daa:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-23810b4dd3dmr37662781637.7.1753154126114;
        Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:17 -0700
Subject: [PATCH v4 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-1-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201527_387863_DB2C2C64 
X-CRM114-Status: UNSURE (   9.24  )
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
