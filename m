Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFCBC982CC
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRKHE08bF5FEkqnsZxxJvNxV0USD+mbs53i/EPyCHO0=; b=aic0MRcM5IVfMx
	QXq4jM7TZpgb/4shIgsUUBgO6nt2SWThKcspL7EFKACaQmNRQVSiR6uqGam9lGeJQPTMrkEgy7gDz
	5ux8LczcTHERqiHNvp7cIwfZZXmUV/LopAqT1KoGILuqxIazOFxWanA5qY4+WILG7jtE6gV6PPKAo
	4Pdnw4kRa7H5AcqFetWmKGla+j4HeF7+nL3+obdiSnW7EhFoAUw6bfuOEFMw2hr2H40Yz1c80a1sZ
	+pqnsDak3knQMm1qmxrEFE2rocLZBGXwxB8ep/OOyv9Egn6vm48CUeLr+gwVlYzx+3nAeQhwEE3zf
	4/g6zUMyUyUY+X0mV0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Crb-0000000H6Wz-03Qm;
	Sun, 20 Sep 2026 08:25:31 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CrY-0000000H6WH-10H3
	for kvm-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 08:25:29 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-486e1a044c5so1372993f8f.3
        for <kvm-riscv@lists.infradead.org>; Sun, 20 Sep 2026 01:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789892726; cv=none;
        d=google.com; s=arc-20260327;
        b=VaMhjvEETaCx0delugiTw7HBLb/i9BuOExIzzR2E6Okhr1MkCJ3TDy/42LPvDRKEVf
         kwmltvarodLZFhiMk6purIVJ0LqWYgEK6W1VoU4vl4dGGciQXSBBclOLKOYzhwir6xIc
         OU5rP88zbIqciN/Kt6eE/64GcnYdP7+2m3Hq+T6TgEvrn8ib1fJ1UVfXGe/iw7izDXnq
         zxvQmO6/vgzSu8ErM3jvEv9ccMw12YhZqPfZEW5u17bn3gudJ6Nnfldu3PpNz2QkT6mh
         9dM67s4c8Z6aZOXpu7O1huhew31QzFaopLVNY5a0KMZXSswX2as/LSCr8rvCfwDsfPfX
         zV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/v5NR7eNmP+HJUBTR1GLDXgKiaOepq2osnsCYiJw7Nw=;
        fh=pYCKvGq7J9iYuXONFLepnBkg/YHbQU96t8Ro81bewBY=;
        b=kDv3iTsVYKccGhN6Jd+LAHeT/+njZRv8l4Htubda9QGOCCSijFy07IgMXe2r9Bw51C
         Y50j0c0ZQ6CDAyEpFj/M4q4nXl/hyKIlrjTKXRiBvbVxHwmZW+vrjz8W/rEFyoP3tz7L
         LP69sjmTtkk9kGaEKPVNdTXj9y3Pc0jDwujxUQucovVdfPHv6XfjrskauZlyekuok9os
         ZLuwsB94pqhDsE8jrKc0nVx0FppRQGu87fwMbgltZVcv1FXON+/FF9Bir8mBHPITo9uF
         kjbGvp9TJc2ntdPGhLEo/OXq3QhfqVWdplyyORVTEOvU1nHVUIx8rSsEe3rZM2WociT4
         fCBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789892726; x=1790497526; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/v5NR7eNmP+HJUBTR1GLDXgKiaOepq2osnsCYiJw7Nw=;
        b=qLzfgZviAQVh43MQ4jVNW5518x6uwPPTt00DJr4De8U5OK9oCcTdW4ugD66YSrg/Mi
         rFQPYHdKXUHa/P+3ziB6Gimhspv5mBb/5s7LF2h9cNW4ziZBHW5+ORWybfWxMnhCh8AO
         8nWLQuuQGAYFTqmNunNTYTgvNKkeO4pg3lXyRwMpuw3cPD0/tKtr5uR0Xr11QJGovC62
         AAP4725j3PqfHRToEAbqn+ErXPuvvjuxdRcb3fcZyVF0KmwIaL5FbHjW8fZc46aInEGN
         4k37nRAKW0rZc7UvY40c39bt8hjsZ/rDGiEEPJirvC8hPUba3XFI+qQ3vog7/VyEn/wS
         pzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892726; x=1790497526;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/v5NR7eNmP+HJUBTR1GLDXgKiaOepq2osnsCYiJw7Nw=;
        b=PqCr/ThGWUMEiB5j/kwMYj3DaY+7d5TDOmQLe+rixZzoX1EK9Dh5wv0hjzTV/nJcWF
         aFgU9YV8yp6xir9qvleb9wVohmW0Nsem3d2+iEbpN6xjkIzknPELX46CT/mym/tft5ao
         XcpYR/Cer+Op/9s8+T5MPgEb26e82EKFc6Y8FrYUqfMWCxNlu5bCXW2/tMKNS151yHs9
         96JjqMx/VxjWR030ej7IDcl8yETjRoSp2cWKq4XloAIAHdNdSeLsW393oQyK8kAcx6RG
         hsrmbV6+RZI7AjpditAZHzyz/ShzU2v5umLGMPocMHh6+hez+o5u+fZvRqM9AxMLKh6a
         xsyA==
X-Forwarded-Encrypted: i=1; AKwUvBzi5L4AlQqJzpwF91oajySy36eANfsnij57GWLK3T7EBqvZuvqt9P6874j54Lcwn+DLxaTibW+lhaU=@lists.infradead.org
X-Gm-Message-State: AFuF++npgcez1stRkbNZE0kUP9bLr5zUS8XWj8BLG1REJKHushvCdNU1
	VeQR3f6lTNI1Q6WPhuMsyXXWqdVpCMVcp4PBx3IIBdg1zLO0BHjx0XCtgXB4Aj0N7yACoz9QdAB
	+xO3PkhxbKfkt0HoRo+Xk/eQlpEKr6cIeSmsJ0mf6ZQ==
X-Gm-Gg: AYBFou2IFN/Z8AzPPEm3/Du/8/uAwqBm+Zkc7KZ80RH8XNWSO2Is8Vh+qhWCk143BAd
	6Pc6ALCSdNT7LwFZR8QnwEYENDZweDV8wpqemoD9U9Zl8u4vMPxb2mfp6CMFg1tI9xM1f5vL53P
	ghAF0uVtgZtl4uIJUmOo7Ug2dwKJxNxascW1L09l49ynKylLzd6nvbOTx+/Llmyg6J8mdd3iEUV
	E9zyW9uQdycW30dxpVCfp3GsWq/gjfkIhK0WXVee+L8yp/HdBRUlWpSAzPv+4XhYB695gqHDm+Z
	JImr+pLvXE/3XdcW/WB9bQ2rMJFB3csttPwORZWsEjhP5CFs+e9UxFBJgK06TdOllWAhTdm7SQx
	7IQ6JidXGSbpjxUgydEBOkD+8ec0esYdlr2k1GD1EYvEd1Ul8kecCah691BnYbMF368d8Oc9Q2A
	==
X-Received: by 2002:a05:6000:2c0b:b0:487:6f0:8658 with SMTP id
 ffacd0b85a97d-4871e36d031mr10347126f8f.42.1789892725264; Sun, 20 Sep 2026
 01:25:25 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Sep 2026 13:55:14 +0530
X-Gm-Features: AcwNN1VHoP9FKod9I1ZhoSlWxL2KyjBkIxPhBW5MLSbl95fW79rnRDNl-xpnew8
Message-ID: <CAAhSdy2MbSq2eGDZfh_EKt2S3OUEn7tJRWUgvncPsWNVR7vqeg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.3 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_012528_313845_88742A3A 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi Paolo,

We have the following fixes for the 7.3 kernel:
1) Synchronize hrtimer during VCPU teardown
2) Fix the conversion between vsip and hvip values
3) Serialize IMSIC attributes with vCPU migration
4) Release unused page after MMU invalidation
5) Propagate interrupted G-stage faults to KVM user-space
6) Fix NACL hfence entry update order
7) Fix sdata leak and stale snapshot_addr in PMU snapshot_set_shmem
8) Preserve firmware counter value across PMU counter stop/start
9) Report PMU snapshot write failure to the guest
10) Fix perf-backed counter accounting across PMU stop and read
11) Fix HSM hart status error propagation

As you can see, the fixes are all over the place except quite
few of them (4 fixes) focus only on SBI PMU extension.

Please pull.

Regards,
Anup

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.3-1

for you to fetch changes up to 41e81f7e3ef96594fb840445343c0ee7723aa550:

  RISC-V: KVM: Fix HSM hart status error propagation (2026-09-15 18:55:51 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.3, take #1

- Synchronize hrtimer during VCPU teardown
- Fix the conversion between vsip and hvip values
- Serialize IMSIC attributes with vCPU migration
- Release unused page after MMU invalidation
- Propagate interrupted G-stage faults to KVM user-space
- Fix NACL hfence entry update order
- Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
- Preserve firmware counter value across PMU counter stop/start
- Report PMU snapshot write failure to the guest
- Fix perf-backed counter accounting across PMU stop and read
- Fix HSM hart status error propagation

----------------------------------------------------------------
Myeonghun Pak (1):
      RISC-V: KVM: Synchronize hrtimer callback during teardown

SeungJu Cheon (3):
      RISC-V: KVM: Preserve firmware counter value across stop/start
      RISC-V: KVM: Report snapshot write failure to the guest
      RISC-V: KVM: Fix perf-backed counter accounting across stop and read

Tan Chi (1):
      RISC-V: KVM: Fix HSM hart status error propagation

Xie Bo (3):
      RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
      RISC-V: KVM: Release unused page after MMU invalidation
      RISC-V: KVM: Propagate interrupted G-stage faults

Yicong Yang (1):
      RISC-V: KVM: Fix the conversion between vsip and hvip

Zongmin Zhou (2):
      KVM: riscv: Fix NACL hfence entry update order
      RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem

 arch/riscv/include/asm/csr.h       | 20 +++++++++++++++----
 arch/riscv/kvm/aia_imsic.c         | 11 ++++++++--
 arch/riscv/kvm/mmu.c               | 10 ++++++++--
 arch/riscv/kvm/nacl.c              | 20 +++++++++++++++----
 arch/riscv/kvm/vcpu.c              |  3 +--
 arch/riscv/kvm/vcpu_exit.c         |  2 +-
 arch/riscv/kvm/vcpu_onereg.c       |  8 +++-----
 arch/riscv/kvm/vcpu_pmu.c          | 41 +++++++++++++++++++++++---------------
 arch/riscv/kvm/vcpu_sbi_hsm.c      |  4 ++--
 arch/riscv/kvm/vcpu_timer.c        |  5 ++++-
 tools/arch/riscv/include/asm/csr.h | 20 +++++++++++++++----
 11 files changed, 101 insertions(+), 43 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
