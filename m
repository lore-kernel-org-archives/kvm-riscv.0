Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFBE60A3816
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNc+UD7Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AU1f67xN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Xt3fg4W1zwMC1kcfWsvDtaLEicpRMKaDJbW6BoClJbg=; b=cNc+UD7Y/nV72towiLYBf/lrPf
	3IgKdLJUERZLxM4Ycn+EEmR+DKrDRde68CjHp8fvOhPvzfS9OeIH9byrdmqudDUnw3+JGhK8cv0HD
	fqGS9xMveqr1MDEFSvNYb9XapYvo9dfRB6d1C5ytXum8uhGXy8rGQrtJ2PSnTZRuHi40kUwCA5BDh
	eQsa0fRbsMoBUEiqAcU2YzPWzPNVkhtD5MFaIqJNfrGPz/ha2cTizh8xxVt+jMNmQdJhRtF9q8fKx
	ALXdLuiOKyacA7WmCveXiaKPQ6/NjVLaPkSn2wE+IElLyFU33dzVh4/1xjNuJNcUSZVHutg7C/3Yr
	INKBtYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8yP-00000007pFk-1z6G;
	Wed, 28 Oct 2026 19:06:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8yN-00000007pFN-2Lgg
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:06:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so11393715e9.3
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793214365; x=1793819165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dd4IpeHUiNMizEyX8fWF380+R7v+Vhvdf5n0i5pAf0U=;
        b=AU1f67xN52NeAlgDCwXZBy1YAL6kaQUuJogzKTOMufNsm+w7lslg6XQcSG4p1SToV4
         5PO9gIAF+kPYdEPm50BfA5Jm0ky3HBETqFNhIHO5TasmoL3BpidHb4A5BcCjuBvdROOD
         +nxyxBqDYpqM7ne3twVIHr3t+zcNLYpF3x4zNxcYbbo2OPouU0ndKlXwC3eiFdKBP9Xe
         vmpuL2dfI0331VQVH2PLsM0UJUKqIR5tE9zXvFkMKmZeXr26YO42+q2wOterewMvJYDa
         xE9F4ZS6NU79m242JOT1aLwVhKaw8Z+K3n065+ZiQt2g63uLL4+CD6bkxIXZ4e3o9Oda
         HqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214365; x=1793819165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dd4IpeHUiNMizEyX8fWF380+R7v+Vhvdf5n0i5pAf0U=;
        b=Y55UjJZu92M29Ez4CADbFhuMHS8XTFJT+dZi3OHxhKHaDRmfbrZn97xeDesheSzGwL
         6Y9z06rCDt+bGe/WLFaD36d+FXvM47sAMzUWD4B6QnfCtf2pPqdnLxOvLUWdvKMWsNb2
         0IUy21ALms3xkzjcTd65YkRCUvEVE/HaRWP3ACpu4x6QQGm4ge/Hl3ohoH865vFPRC0Y
         vhbuytoN/5dCriU8gW4GOclu0lq8D1q9y/tP5T0WXnJIb9SDxX0H3+VaB+mbj7U/+AKF
         pH4A/+Ow1Dam1/tNQKriTUg4RDnxyCfroKOU677iPTBINOLtD2W5FmgZ61RdjtDorRTu
         SIZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgYQLfRK1gXrtj4VfyCoGALpZEJj3mXh9aAB9PqaMoAaZ4yuiDtnTHAkixfmKgijUywZPzfGZUBSE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKwAoQYGL/DmW4VhMuTvs94MPJZ2qB14Soe0iPXozgWPJ/BMWH7
	PndtwfIL7OnJlqT/go07N+J6JrTQESwlHxRlyYo22wimwbLLJ4ENzAog
X-Gm-Gg: AYBFou0ceBgI3jc40ek83eEWt0A7LgoC306DTmOBM21i7eG+yJQGUJk+ayPXBLqactc
	rzL/Qhumll+EuK+ckQ8cjVPNi1B1boXyDR0YoOC0cNUbxDXgdB8+9S3PcnkNsErHyefiNYz8zrb
	D16EZJ2zWD1QG9ArKIWImXi9/2yo20IS6mhkmQWyDQdqN/cyjLTo+hUTddkVyCiIbiuuBIXWvw7
	C4e59/TvTUhOaGqIQ4bmZQHXtbyQFo33Ou2Y1JRDVvx/FEwZERYsDpSv698nuqztCOT7O01WOpr
	i4y6XeKrvZPxwb69Su9wdIidX7kjLD8KfFMYQ6IyCMfitdYI9dWPQlU8VLAOcT0u8HEaNumS5JQ
	D9S7DrFAfmmxw2oDDaRXLttc35FmRLQxBmDgdyNEQBhgl0DXfhLo2GNt/cBWAi+jzaHDFzlwoDa
	p14ivWMSMh8a37n+hKrqkAIJveuXc8OLL7YrBFWZ+O8ATGQ5Tw1R5jqMDS4A9rK1pUxO5T1X9rz
	DmJnV+42a2dZnDtejwWMbnJMn6xDud4U0rm7Qe6o8eva9SsZHxNT0gzH+r8rSic4ozj5992RsTN
	90t1fLaUz2odzniolQPNlgh/trTaEkdF5arJaiUqhw==
X-Received: by 2002:a05:600c:4f55:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a9661ab508mr72013285e9.16.1793214364715;
        Wed, 28 Oct 2026 12:06:04 -0700 (PDT)
Received: from IsoOmenaM3 ([91.136.216.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm10688455e9.3.2026.10.28.12.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 12:06:03 -0700 (PDT)
From: Mika Tammi <mikatammi@gmail.com>
To: Will Deacon <will@kernel.org>,
	Julien Thierry <julien.thierry.kdev@gmail.com>
Cc: kvm@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	kvm-riscv@lists.infradead.org,
	Mika Tammi <mikatammi@gmail.com>
Subject: [PATCH kvmtool] riscv, arm64, powerpc: Align the FDT staging buffer to 8 bytes
Date: Wed, 28 Oct 2026 20:05:31 +0100
Message-ID: <20261028190531.48302-1-mikatammi@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120607_616400_2B7D028F 
X-CRM114-Status: GOOD (  16.25  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

setup_fdt() creates the guest's device tree in staging_fdt, a u8 array
on the stack, and then copies it into guest memory with fdt_open_into().

The Devicetree Specification requires the blob to be at an 8-byte
aligned address [1], and libfdt has checked this since dtc v1.6.1:
fdt_ro_probe_() fails with -FDT_ERR_ALIGNMENT for any other address.
The sequential-write functions don't call it, so the tree is created
without errors and fdt_open_into() is the first call to fail.

A u8 array has no alignment requirement beyond its element type, so
whether staging_fdt is 8-byte aligned depends on how the compiler lays
out the stack frame. In lkvm built for 32-bit RISC-V with GCC 15 and
musl, it isn't, and lkvm fails every time:

  Fatal: Error creating device tree: fdt_open_into(fdt, fdt_dest, FDT_MAX_SIZE): FDT_ERR_ALIGNMENT

arm64 and powerpc create their device trees the same way. Nothing
guarantees the alignment there either, though it hasn't been seen to
fail.

Ask the compiler for the alignment that the specification requires.

[1] Devicetree Specification v0.4, section 5.6 "Alignment": "The
    devicetree blob shall be located at an 8-byte-aligned address."
    https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf

Fixes: 7c9aac003925 ("riscv: Generate FDT at runtime for Guest/VM")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Mika Tammi <mikatammi@gmail.com>
---
I used Claude Opus 5.5 to track down the failure, write this patch
and its description, and run the tests below; I have reviewed the
result.

Tested with QEMU rv32 and rv64 machines with the H extension as KVM
hosts, running a guest with lkvm built with GCC 15.3, musl 1.2.5 and
libfdt 1.7.2. Without this patch, lkvm on rv32 fails with the error
above; with it, the guest boots on both. Build-tested for x86_64,
arm64, riscv64 and ppc64le.

 arm64/fdt.c   | 2 +-
 powerpc/kvm.c | 2 +-
 riscv/fdt.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arm64/fdt.c b/arm64/fdt.c
index 3cbd36e..ec83caa 100644
--- a/arm64/fdt.c
+++ b/arm64/fdt.c
@@ -115,7 +115,7 @@ static struct psci_fns psci_0_2_aarch64_fns = {
 static int setup_fdt(struct kvm *kvm)
 {
 	struct device_header *dev_hdr;
-	u8 staging_fdt[FDT_MAX_SIZE];
+	u8 staging_fdt[FDT_MAX_SIZE] __attribute__((aligned(8)));
 	u64 resv_mem_prop, mem_reg_prop[] = {
 		cpu_to_fdt64(kvm->arch.memory_guest_start),
 		cpu_to_fdt64(kvm->ram_size),
diff --git a/powerpc/kvm.c b/powerpc/kvm.c
index 7b0d066..fb374dd 100644
--- a/powerpc/kvm.c
+++ b/powerpc/kvm.c
@@ -296,7 +296,7 @@ static int setup_fdt(struct kvm *kvm)
 		"hcall-splpar\0hcall-bulk\0hcall-set-mode";
 	int 		i, j;
 	char 		cpu_name[30];
-	u8		staging_fdt[FDT_MAX_SIZE];
+	u8		staging_fdt[FDT_MAX_SIZE] __attribute__((aligned(8)));
 	struct cpu_info *cpu_info = find_cpu_info(kvm);
 	struct fdt_prop segment_page_sizes;
 	u32 segment_sizes_1T[] = {cpu_to_be32(0x1c), cpu_to_be32(0x28), 0xffffffff, 0xffffffff};
diff --git a/riscv/fdt.c b/riscv/fdt.c
index 1eb45fc..4a2c456 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -341,7 +341,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 static int setup_fdt(struct kvm *kvm)
 {
 	struct device_header *dev_hdr;
-	u8 staging_fdt[FDT_MAX_SIZE];
+	u8 staging_fdt[FDT_MAX_SIZE] __attribute__((aligned(8)));
 	u64 mem_reg_prop[]	= {
 		cpu_to_fdt64(kvm->arch.memory_guest_start),
 		cpu_to_fdt64(kvm->ram_size),
-- 
2.54.0 (Apple Git-157)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
