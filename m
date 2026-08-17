Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79360C5CFC1
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AAB3Tr5HCZDjrkUSeeLxhmgXuIlYKOft/KrCc60u82o=; b=Ko6PbyYqfev38I
	zHK5rnR9UbTD9DSdVGsiJ8MyG4OMKoA7gR3wANp08o0ZymZRImYOJxyLfLclkyyqbUTIQ983+zRTM
	8DzthQ/M3EZjnoRPlAGoXWT73N3nE42xz9djs1C5VUfnXtuiZToOs3nGN3aGfFoc5cH2Tm999girL
	s5p+Iq/vTLYt4RhgRV8RnSx19lajQN72Gg4594h+umWDA/jpjugNozagahAo/NruDnkdK8wJ0RXMg
	Cp+dif7kMyh9woWTYY25p2v8+7k+RlZleNX3fEecaLOz1lYUFKktUJkXxivu3oqUvknKeAk6nRIM0
	ge727MGqb7y1g3i9M7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrqe-00000005YzH-0Hlk;
	Mon, 17 Aug 2026 07:33:32 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrqa-00000005YyY-46MB
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 07:33:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cbf0dc8c871so1887123a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Aug 2026 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786952007; x=1787556807; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ctO/918wY9I8dgMN/rNhQAZPgaBP/6EBpuY/G7CkCVE=;
        b=Czlf1kLXtP627RCBYQdmTFAYRit6NDSSmhILmIoa7VYSV2TlrDli7Mdjxyo+USRWtm
         DHr6JjAjh8G6qgnHcMAcQZUzs4UReztrPKWHzwaSDTwERCqZgzZ9FKLdjkyJIoGP4xZf
         ssnsRs4liWzcdAgP6gcAIlHVRQ4RuU2JNHmDkkbrqSpSr8VeDhHuR6CVx3NpMJISDFuH
         aodDA5miXQeTKoCrL/G8YRDUiQN2ByGaH5kg3I+dElx212Yde/NvTeKfNOejytEqVGxN
         pdlcU3jWLbboFjQlIRvjfE94RJS60x74i7C5KRGSA2NM8QOMhZxjK/H+/I8iPYqU7tIr
         IgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952007; x=1787556807;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ctO/918wY9I8dgMN/rNhQAZPgaBP/6EBpuY/G7CkCVE=;
        b=WMMyMGiopy/r7XDnQGdXkV7slQHZapdr51BKke4D/YuCfAOjLFeqCnUHPLQ7mXxTPP
         uMD2C55PkXfaPG5GO+ij83DQfbGp4kp1EB4WUPIsbRpM05In9Q17GHgEG2Cym5BKBudO
         e3wBkfDDzZxFu8r81inM9FMALizezh8lWCriVTvxL/W5rj/RMe0rpoOndNi8IgFsnW7R
         vqXUPahG9281zmX/44yPjabf2nhiIs3DLtOuLx0A4RrPOFz0GRahcjcKkWw9oqAMf/1p
         YvZcNCplBNVBh7rnRiKHfxFtBeAfCcYsR3FTE+mROrqXR6Mwyhu4vn/sGJ6MuMfsxNHA
         SPVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpn6CZKje8nYKirfW62BSRnnwNwDCs/cM8VTYqoRXZczLeY3hXXOu5Oyz2AKWkgRE5mczhrpOuRcXE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmsPOcewIqBaykl2iQgKY63huyetTAtLFI+sI1EAr/TNZQpDbz
	pIBgM6Qjg5485cRjTafAe9WiWOq/D1tNTlC3raB+eHtyB8jdptMlU9+u0BiFJ/+hPTY=
X-Gm-Gg: AR+sD123ywRLsly6hL4bz4HIEkxJa/FmFshUohI3xLuXyRucTzSYT7cH5dobcR4B2gK
	Ybta4jH89mkzE4mkc3x9+JsRv3iOPr1NKc5b4EfIGhCwcT3Jl8zqh1ui9ArUMhW2zYP+MXbAWvk
	+z2uhOJ6AxV8LwIXFBxHY+T1phvLMyV/njN/MqIgfRwshl3erzBAHngWANJBhMWAVRlYnblDLvV
	7UssCCqSdmyUVwMBNA8Lcik7VwBLPHxTAR3HPHmHpztrHBEPAl09yF/RHkO+PSFOkplYKs7bpo3
	AYnGPHt/PWUUPMn4onPmvpSvM322dqFezTPI/LBPVm+0fqoXENi9uQjlqpsKgYkwmYbRpWLmay9
	2OLyiwI6vIbZTS2zJtED1k+Gt+IBOleNXq6npEtlDsAM3pijiQ3oMBgejJQdLEmRJ136hGFWAD3
	p5OS91zuCfH7qNl/eSQWYy3CoBkt72dtzHRPXcNDcgu8cgHCliZ6aMTSs3fQJZw/qoctmMg1BJ1
	NtUTCKG
X-Received: by 2002:a05:6a21:7702:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3cc7196eda5mr27885097637.7.1786952007506;
        Mon, 17 Aug 2026 00:33:27 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326796d646bsm3575972eec.10.2026.08.17.00.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:33:26 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 17 Aug 2026 00:32:59 -0700
Subject: [PATCH] KVM: RISC-V: Clear HSTATUS.HU on hypervisor initialization
MIME-Version: 1.0
Message-Id: <20260817-hstatus_hu-v1-1-28c53cdfb408@sifive.com>
X-B4-Tracking: v=1; b=H4sIACq5gmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3YziksSS0uL4jFLdRMNEC4tEI/Nk8yRDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaANvzj4duAAAA
X-Change-ID: 20260817-hstatus_hu-a1a88a27c7b1
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786952006; l=1212;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=tM0pTha1/9nfcltCgNGuo/8gpha3J9wIDaj3gZsBSBo=;
 b=xzAemguTvxKYZkrL488xqh1xU5+sYfHiXmghrUUa42oEqlIaC+MMhYmzECXbY6IRHF230q1PA
 xRvrYY3gIRDCL/W3d8Js+WjMQhGkDGoZJqmExKFef81IWvX/6NJVnCE
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_003329_019956_D0C81D94 
X-CRM114-Status: UNSURE (   8.52  )
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

The RISC-V privileged specification does not mandate HSTATUS reset
values, leaving the HU bit potentially set after hardware reset.
When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
U-mode to access guest memory, which may cause unintended behavior
if not explicitly controlled.

Clear HSTATUS.HU during KVM initialization to ensure hypervisor
instructions are only available in HS-mode, preventing unexpected
guest memory access from U-mode code.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/kvm/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 85e772588fad..e80a99e93d56 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -47,6 +47,9 @@ static void kvm_riscv_csr_init(void)
 	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
+
+	/* clear HSTATUS.HU */
+	csr_clear(CSR_HSTATUS, HSTATUS_HU);
 }
 
 /* Clear hypervisor CSRs - called during CPU offline and non-retention idle entry */

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260817-hstatus_hu-a1a88a27c7b1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
