Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93A9E77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5lXpACB9aqQ1qg763ls0mcgXDHB+kemoc6J0SD6K3og=; b=bxNvfsbGj0Xogd
	fzPgjLizv2k9qL+ybbF+G4Imewc2mA6YW3bLBXF7CMowRHuSt4Su8x8o+jBDJFZGXDxKSgXFNcB7d
	+NxQRmINKe+9rPcurknNRBlwwqhtxsFDcdiNGGCKyokKRHB8rJx7E7cw4GmlogTOAwgUJ9Ps6jTYm
	DUpo4GTCOeUb/SUgHOXuBNqmyaeJeQsQ7ZLxZNQIksuXUx+3odQT29AjN0ixZtzM7qcCezR01gxGw
	6y8xCLZcJ3wzA8VhsXKG5Gm+tXpnJCpkXBeK/2IRmVKrxqXOknM2v+HHtcrFYUglK5Pg276yO6wFH
	kztByxqck3KFeNHeUcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5P-0000000CnTi-0O0B;
	Tue, 24 Dec 2024 21:05:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5L-0000000CnQn-1Nkm
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 21:05:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21644aca3a0so66421335ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Dec 2024 13:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735074298; x=1735679098; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sI1JaJkunk7xEX9+Xf01iHnjfpujHUUVPbR0FhepJuw=;
        b=sZmb5OoBkH8v++bXB7Hxwmnct6ugvQjJtVxETsoztDSPtjVsIIJFtq248q5uUbTKEx
         U2v0WQWHapaQGvd2ldsTxUFiyivyNgO1/OWSs6tYLLCBep0/t/HvBuuJ7fnee3iG7/Cl
         2a4GYv1b+REhcvl74Zm8mc/XEb21bLZjy0kRXi3fIrEw2VzKG6NYjvb5S9ntOnvWMkY1
         CWUyjGi/NK+m4r0cpdH2u/jP1WcCqr2VxfUchrWNvcxk5JV2crnHk/03xRRfwsutGh0d
         ci0DEH+mBv0CO2CoK6R56612ZO1kJ5Jvfi/jku2Aveeh6C+1FQhA0Tp/n462kfp6Dxqn
         G5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074298; x=1735679098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI1JaJkunk7xEX9+Xf01iHnjfpujHUUVPbR0FhepJuw=;
        b=aMnoiLeZmlBQYk9e2o+MJw4p8XeCeOfyNQzWBx/AYdmUcnGPj2epZpy0/gTJKT9Aic
         OA2VecXFkqHbejoJPx2fa/EMsZ3ZUYC7KgcJ6OKLor896mbENwRXZ4RZ664c8RaHUHoh
         +2nWCyWRA0zx9JdKJVbdWJREuEO028a6H6VVOSCsz0Lv2TgWMoQo0xLPlMLhf1CaWF5P
         0euMW0jl9s5LLDa89D22nx+CHUDtRRDggJkqovLM1meVEyDYizhTY65Pj32AJcJhaacp
         rt/b38jKmJmbsljtYQuzLmcNQGKtJSFOCh0jCXnaVkcoAjvOcXnuudTuyudOOk3v6dRG
         uMKA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ieHRsbfv8fVXhZKpE3MG0l+xHfQkbapdhm4YOkZUSbtQoN/I4acgkIY3wv9nZGxAnHuQuRwchmY=@lists.infradead.org
X-Gm-Message-State: AOJu0YykWxD4cae9M5D/Fem2l+LAA/l7iItswakwnE87t1+J+64aZ0Au
	aDYLgXItW4Ug2ExWda7k/3+Y0rx3wlMH6XoUYW5a2Ps84ODAZLE9vXkzkcDmxac=
X-Gm-Gg: ASbGncsTr9f/xEziE76JQJ5thANiuqbCSy5p+Go8q28VrdQJWgc4g72QDWpq6rPP1KP
	yYgiUuasMChSHyoVXBVNrbRYcSMrVZCQEXItoQ4WI00/HgyCEkb86KUN/CivmuTLo7aUNmST6R2
	RffTE1ZqgzYYiEAMHqVucEnnMy/rm9s+eNIZep0hGthZpWO4rGOebEEvUQ37wGOTqDBMdJnjdCd
	dOE8A+RYmUWUbLnbk88VbNEVemBRpjn3MOuiTLNE0dPSqB1M96jQov4bYHpThZxjYHpTw==
X-Google-Smtp-Source: AGHT+IFPEALDBCpfdEtIoSSL0284tS67mJTa+n5sXWkYGZrMoWfeQCLlRAzW2Jd/Ci42z7TCaOpkTw==
X-Received: by 2002:a05:6a21:680d:b0:1e1:ac4f:d322 with SMTP id adf61e73a8af0-1e5e0484559mr28688385637.14.1735074298296;
        Tue, 24 Dec 2024 13:04:58 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c344sm10445925b3a.186.2024.12.24.13.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:04:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/3] Collect guest/host statistics during the redirected
 traps
Date: Tue, 24 Dec 2024 13:04:52 -0800
Message-Id: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPQha2cC/3XM0QrCIBTG8VcZ5zpDxUl11XvEGE5tO8Q0PCbF8
 N2z3Xf5/+D7bUA+oSe4dBskX5Awhhby0IFdTJg9Q9caJJdKSCHZo6zj/PKUR8oms8kqfda6n5T
 g0E7P5O/43sHb0HpByjF9dr+I3/qXKoJx5oTRjtuTlq6/JiyRMNijjSsMtdYvpm/dGa8AAAA=
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130459_585175_5D421F33 
X-CRM114-Status: UNSURE (   7.91  )
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

As discussed in the patch[1], this series adds the host statistics for
traps that are redirected to the guest. Since there are 1-1 mapping for
firmware counters as well, this series enables those so that the guest
can collect information about these exits via perf if required.

I have included the patch[1] as well in this series as it has not been
applied and there will be likely conflicts while merging both.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Improved commit messages in PATCH3. 
- Added RB tags.
- Link to v1: https://lore.kernel.org/r/20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com

---
Atish Patra (2):
      RISC-V: KVM: Update firmware counters for various events
      RISC-V: KVM: Add new exit statstics for redirected traps

Quan Zhou (1):
      RISC-V: KVM: Redirect instruction access fault trap to guest

 arch/riscv/include/asm/kvm_host.h |  5 +++++
 arch/riscv/kvm/vcpu.c             |  7 ++++++-
 arch/riscv/kvm/vcpu_exit.c        | 37 +++++++++++++++++++++++++++++++++----
 3 files changed, 44 insertions(+), 5 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-kvm_guest_stat-bc469665b410
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
