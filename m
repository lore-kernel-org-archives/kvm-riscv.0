Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E069E7717F
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Br4OvCPxGHD7HJJ9d6ZGjL2OJNiGOt2tGSPgIHe/RBM=; b=AcwEf04Eto6wqV
	2qVmvKzlB0FeZABF343EDJydyTGfH+2zevVfHp9V7fIjvItmAZAGsszvsaXsH5CnoJufOHmVy7ZBm
	BqR1PvdS873atAKCDz88yH+E0eSfq65C33+LcnOcMNpU2k7bKHAy0+T0Ln1uxnzT0GFS243JOc/U0
	WB0pWqsSsuIL6I/kzjM8HBhA7EjFzLhw6tV8BxnS/nUF5TH+kMTxZT8SF2A42zf9q/6bZweu8Oqf4
	OfKlQ7tXH+oWeauTQg+KcVFTkl5VijyhUliMj39p7PkC5s+Mxesp9dLeNhEhR6KF3jK7U8bNWromb
	qxwFxySa8yEC9WAI4Yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3v5-00000003Ztn-01yd;
	Fri, 13 Dec 2024 11:33:19 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3v2-00000003Zrt-3Gqe
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:33:18 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-21649a7bcdcso15972155ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734089595; x=1734694395; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26MbCcxBXRObwdyBKZjlPQXxYB9MTH5C48d0Ryy4x64=;
        b=FV4V6lrKHHlfzgOS6T/4NXUtd8EVf14N6a88DCaU6NsieK28KeiV0pmVREzwPcpK2Z
         KpLdRkwFOEJVXc4LEO4gxveP9k4g3xsq6mcsjFCHynDZwDHIKqYT05nITG3WV6U/MayZ
         IaF6FwYWJjvB3E2nm2hmj4ACP+Znpk6cpslaAvUVNzPAoFZx5X1pdnAJy1R2fvJnPKaY
         W3ESJb+3x1gdMT0DUX9jrndtsgVvpVgxTqC1OnC4s46rVao2Qt0Y7xvpqX4MEcSMq+Rj
         DKX58EEZT3xQCW0BBdYD3CNvfsTo0fQ6oddSfGEteGQu5DNh6FI9K/aDUyci09ILeRgi
         l2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089595; x=1734694395;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26MbCcxBXRObwdyBKZjlPQXxYB9MTH5C48d0Ryy4x64=;
        b=w7hB5BfgHUO0MbN3Ro9fSSpvS9ooLJxJ4nQ1ohr9sbAk7G5Bgh7C/m9vv0N2JnjyFh
         /K4umAZh+cxsyBZ+YARVoVQ31ARqvNVC8RiZUrrSlh7kuyuoVERgDC9DVbLZHmZ/DL5S
         8VPDT/Nz07ZIhs270s7Z9RQOIX/sQHfVKuthKWLY//q0Lcq/RY4I4N7DcCIo5BJNEZAw
         PZNDTkgOnUFpHSEiasvEwopQQbtszYelQRaDd63gNTqH5WZc2SwIxH4Uot9lGBx+I2sR
         V8H4E0vkEPO54a+JMbRWnz0AGWygXtkORC8NwGXQ5tFCr14Nsfm6OZRa9exxFJ4g3OOP
         UHlw==
X-Forwarded-Encrypted: i=1; AJvYcCVd7A6gxBauGXLEe1YKTsZKxR/7V9OKBel/Q73c9jdVK++bFzkc/ktPBZfmbzlxImU6iruA0dqvv3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzncxJ9F1WsI+RgtJ7D5r11oSQ4n/VZ6e42ui/HbwlepsYIHLSy
	vbPK1kmvga57Cf03mWKPlrzm9j3FCC9rxQQDPJjwoqo5cweq1CnToxobPvp0uDM=
X-Gm-Gg: ASbGncsshbmTdI0w/m4Au6W1sCHQINSa45IN33s/+1mLpa8hpimZvXEB3lheiOvSYk7
	+IeD26ixX3TtT92K5t4L3GSnoMtsZzen6QuOIzRPnmNoojZ/ulj1XsoJCvbGwzHNWbKjz5z/c11
	CFSwKXwK91kEDqOT/FQxjFdcIbxvb3t/a/yjbSgpORRleBc4JvYr3fVp91jFkWQeH+BR0qKAGX4
	yECxR4mZ+NcjSlcYhPcTnwD+YEAT3pF+HHCOeamwsosJ1osWQ9jncM=
X-Google-Smtp-Source: AGHT+IE2aHmaFHTR9iBiCUjqMgt+u4ssTP/m0KwR0xBzwYlNhga7euk988OdWGvjpY5KeC8o/0oqRQ==
X-Received: by 2002:a17:902:d50c:b0:215:bc30:c952 with SMTP id d9443c01a7336-2189298a144mr36097955ad.6.1734089595266;
        Fri, 13 Dec 2024 03:33:15 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm103327125ad.263.2024.12.13.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:33:14 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH RFC v4 0/3] riscv: add Svukte extension
Date: Fri, 13 Dec 2024 19:33:06 +0800
Message-Id: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHIbXGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3ZTUMt3cxIoM3eKy0uySVN0yE11jE0MDw9RkSxPTVEsloMaCotS
 0zAqwodFKQW7OSrG1tQCcvFY+aQAAAA==
X-Change-ID: 20241213-dev-maxh-svukte-v4-34101ec945e9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Max Hsu <max.hsu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=tbP+jC6o0WUbBs5wzvPexsjiCSh2sPVpbTXynXjrfGk=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnXBt3nDotuBhQJRSQUC7kSPKHLLlxqASJuOrQK
 U5Px7fhMk6JAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZ1wbdwAKCRDSA/2dB3lA
 vcR4C/4irx2RT/e5bqfqAIm563+xO9z5R4UvXSir/eIK9aVaHYeMVqEdWbPauFsH5lGk+WLVpEh
 B9p8z3ebch6wZM/EHolPkw5wCN6bU7kouNEK4mTX9ciVvsgk2viGkFg2kuwQvxkDyPPTI0lG8py
 1O3tqm3kG9nv6YuBgJE/jFYHQK7AWqyGq+Z97fxy1+je3mdJ360SkwAJwLJruDet2/B39bd0wud
 Ye+9EUv44RY8nUGvq1E2teWhCcDGwysMSPwo1euaAG98AGzu82QpJMNE6CVjTcjryau0iu9eXBi
 XYoOpu/POI0s/hE8t+RQpofxtx7Zxn0jbtV98fsNKJGCkHm2jPIwTetFCcRnxQ6+qY1Rv0FSUr3
 rFMddvmyn+KHaBt0yccQpl8GOFWWUtn2G75N80wP5IUUW0H/6i/bCh45IGKSEVIMM/elBip6kNJ
 6sczUcrwCMH7g+b/5nuLrefqZXCg3p8Fk8/PBw0e9gXgz5aFBEX3c4jf/BR6ynSkuAHds=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_033316_810838_45A0E2B4 
X-CRM114-Status: GOOD (  12.09  )
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

RISC-V privileged spec will be added with Svukte extension [1] 

Svukte introduce senvcfg.UKTE and hstatus.HUKTE bitfield.
which makes user-mode access to supervisor memory raise page faults
in constant time, mitigating attacks that attempt to discover the 
supervisor software's address-space layout.

In the Linux kernel, since the hstatus.HU bit is not enabled,
the following patches only enable the use of senvcfg.UKTE.

For Guest environments, because a Guest OS (not limited to Linux)
may hold mappings from GVA to GPA, the Guest OS should decide
whether to enable the protection provided by the Svukte extension.

Since the Guest OS may utilize the Svukte extension simply by setting
the senvcfg.UKTE without any trap to host. In the view of VMM, the
Svukte extension should be always presented. Therefore adding an
extra entry in kvm_riscv_vcpu_isa_disable_allowed().

If the Guest environment wants to change senvcfg.UKTE, KVM already
provides the senvcfg CSR swap support via 
kvm_riscv_vcpu_swap_in_(host|guest)_state.
Thus, there is no concern about the Guest OS affecting the Host OS. 

The following patches add 
- dt-binding of Svukte ISA string
- CSR bit definition, ISA detection, senvcfg.UKTE enablement in kernel
- KVM ISA support for Svukte extension

Changes in v4:
- rebase on riscv/for-next
- add kvm_riscv_vcpu_isa_disable_allowed() entry addressed by Anup
  and Andrew from v2/v3 patches.
  - update the cover letter for the detailed reason
- update the commit message on dt-binding for the Svukte ISA string
- Link to v3: https://lore.kernel.org/all/20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com/

Changes in v3: 
- rebase on riscv/for-next
- fixed typo in the dt-binding for the Svukte ISA string
- updated the commit message for KVM support for the Svukte extension
- Link to v2: https://lore.kernel.org/all/20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com/

Changes in v2: 
- rebase on riscv/for-next (riscv-for-linus-6.12-mw1)
- modify the description of dt-binding on Svukte ISA string
- Link to v1: https://lore.kernel.org/all/20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com/

Link: https://github.com/riscv/riscv-isa-manual/pull/1564 [1] 

Signed-off-by: Max Hsu <max.hsu@sifive.com>

---
Max Hsu (3):
      dt-bindings: riscv: Add Svukte entry
      riscv: Add Svukte extension support
      riscv: KVM: Add Svukte extension support for Guest/VM

 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 arch/riscv/include/asm/csr.h                            | 2 ++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/uapi/asm/kvm.h                       | 1 +
 arch/riscv/kernel/cpufeature.c                          | 5 +++++
 arch/riscv/kvm/vcpu_onereg.c                            | 2 ++
 6 files changed, 20 insertions(+)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-dev-maxh-svukte-v4-34101ec945e9

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
