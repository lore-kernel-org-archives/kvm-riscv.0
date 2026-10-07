Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C263FCA5FFF
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dm9usireN71A87RB+hBWc2Y6qCLAP4be7wCmTJXcLag=; b=E+eecANnPi7y76
	DuOhIPAOiqd23Y3QKDbAN9msfoyMvk6Rh3QnhZ3Hv41+XE17vesFflvZprDS42n2sSTqknzsNM92E
	4opr4AfrxrdAqV1EmL0OYfxAwAaG9ps14arlA8K3S/tJk2zS62vrSZ4QT4UZz1oAvqzxclIVstyPQ
	0NfsrLJZmFPjhENqX4PtNAUQCVLgRbz2NJNR4dlICOhQl/+mdwpAXLO9CmO6i3GtXkr79pAE+vZOk
	FggVZUT0oVh6R/NqBVCTCxgatos65st/0fGAwVwQr7weSohzL09rJaSnyfvTxay84fnUstvok3ecP
	kk1Eb4OP+mYVMP1NXwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN7-00000001zN6-16eF;
	Wed, 07 Oct 2026 08:51:33 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN3-00000001zKQ-1j3F
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:32 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-15dd124bbe7so932584c88.1
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363088; x=1791967888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCMbjJ3X9YJK0WmXEdBRTsj/mM68fTtj3FZOapjyhk0=;
        b=BkCvaROCh57/nfdi2q57nEA7ShQXzr/EHMLt4UkjFvJnruk4kOXb0IXERd6//B6tof
         OnFbGaOZZl5R0UMerzAqCl+F4iyQmI9HEWxY/f+Ypq7/+PPWruG/IoZGsve9Yl4Bjr6l
         C53pLh82cKwkS42+loKiVDT+dXXoeheArIPCMpBD3fuOPYQRUiTyVcFYxt9VavTxFHua
         gC3+dUAds6fD+Z5qYLw8YPprqxO8g2qqlNV/nULizRrg0nOFyrFDr0Mr+cVWvLchNkTu
         XufAgm14BUWJwK9FAQ8O1q5BPGYBPUSabSMebh0pzAOIlS+hnaXWzAIaMxY4zHTCILOO
         HRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363088; x=1791967888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCMbjJ3X9YJK0WmXEdBRTsj/mM68fTtj3FZOapjyhk0=;
        b=GGtW84I8Ylw5mRKmqEnzbbNeU7jftTttOqGR1o+7dhuGQvW67GUYvDQyH6Kx2n5/py
         HES4jqJsfaEoNflcStQmYqHgHdqsnrDwT2d/ofzYUZqutedB4SgV+qGL7oDTnCh0RHTm
         CtLGT9CzxLTQHuTbq/jnCgt3AiP0CB/phMefJcTkWsz+0dT4n+MHM3j2Z9pQevn0quDr
         VuYaxEKEl3XU/fxaWCbWvB2cKQhPR49Eh1p8DvFWPFzQg4uTZHdsQBxIhEQkVjmFj8D7
         CsI3aSzdQOV85U7xO/bQnAPD0yCFKc6Ce9FqhmmIaU/uT2AD/nSHUBbSyn5UZOrgMTsp
         2iCg==
X-Forwarded-Encrypted: i=1; AKwUvBwleEXtEQOa7G0POdw0y8MFKiMrv5x62jIucXwIxb2Qo67CmjeNvVcQOvqzLEvXhr3f1B9dO7Juuas=@lists.infradead.org
X-Gm-Message-State: AFuF++nePD3NaiId16X+7SbXAAxZyRYbR/t3cfDFbqLb7nzRtc3YQp7E
	g1KMqSwl26cX6YSWlUEwLL6wLpzIOAbA/nPmWf02X/6ZZiqBNpl0KC1R8HWqRiMvTdA=
X-Gm-Gg: AYBFou1QGZp+ZzV7tKTdRJTEMXYTVU4ToRNNL5brjaatUGyoHmY17OnE0JRuzWGwlZL
	av2g6OdcfOHUYbP4p4I3bjbmDAOErPuK1IR9Hd3+NwX9qo2wfS30nbWCruWOBvhg4IrswDErLMA
	G1376vOYS2Lbo6uv2ST9NeYsJ23XBK8Rj15gi8zI7l+Fhu9h1a4xVGBEzZ00NIDlxP/z38LrWWu
	xrts+pGWzM6JkpVz6sTwvcpNYBORCsOkyqiFeLqeUeHiqLlvAT5K2H44BKQHtTU4a/IgP0RZu7t
	MUU/RtGvpXiMkC8tINSQ7V2cBB697j0UCRJFl38ojX6mOzYlVl+Lc0TrWyTEkOCGWluB1NA8WTR
	gOTNTgxfdVmIoOSvdkoYjKtWJvIOifr2ve8QWZCl3uzB5aGvq+EdpArsamejXB6yqKkW9u1rzi4
	O4C+W45JYTK05zh30dF0mVBUitvf9FhCP7eGLw0T2LyqqsP1usdMfMI+ujM35beZzHXxic0IVS4
	j3Do9Y11yJbd/DRJBFF
X-Received: by 2002:a05:701b:2314:b0:151:d6e5:596b with SMTP id a92af1059eb24-162057f2d5dmr1554267c88.9.1791363088227;
        Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/3] riscv: Deprecate userspace vector control interfaces
Date: Wed,  7 Oct 2026 01:51:15 -0700
Message-ID: <20261007085126.222688-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015129_463437_B265CB76 
X-CRM114-Status: UNSURE (   8.82  )
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

After several discussions within RISE and at Linux Plumbers 2026,
consensus is that these controls create more trouble than benefits, and
should not be used. glibc will not support using them[1], and we don't
know of other users. There is also no plan to add similar controls for
future extensions that add register state (e.g. matrix).

Let's deprecate them now, hiding them behind a default-disabled Kconfig
option so distributions can avoid exposing them. Hopefully they will not
pick up any new users, and we can remove them in the future.

[1]: https://inbox.sourceware.org/libc-alpha/20261006134856.42295-1-palmer@dabbelt.com/


Samuel Holland (3):
  riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
  riscv: Deprecate vector state prctl/sysctl
  RISC-V: KVM: Decouple vector prctl state from VM ISA

 arch/riscv/Kconfig                 | 13 ++++++-------
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
 arch/riscv/kernel/vector.c         | 12 +++++++++++-
 arch/riscv/kvm/isa.c               |  3 ---
 5 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/deprecate-prctl

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
