Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106DFE7719D
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 01:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=blTiRLUCz2tUO6F11N1+hceo7YVaNLvA/orio5ka+hI=; b=fRSSil1U1YTKRw
	Vr4PVFRXiMPH1H7QVJhhIlRf74YuSIAjSWNIMWWZRSeMMGy8qHNmYtq3rxy22qGMw3Vv21QFfChIl
	KF9b0/Bw8vfLf8yqntsK1doTn1cwib3mXqrCijLApEPgshvMlJ23RRowE1M8wqIIq91NOKA6SwCAP
	6Udtl2Vmc8VEZsMBV3FKYuUxoIQ+PvAMp9KoAlMfLMnRjJYKNMpdZtSSHFqWTe0eiKv0U0APJgaQM
	RtSxEqvnUQzHv+RiRLq+3/ev576S6qA54oaCy14lkxkIj4Rfa4mIxnKcsOAkmSdOB0rTXciFptG15
	pK2B5XuM2AB/0W3cPsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQg7-0000000HX4d-1vjk;
	Sat, 11 Jan 2025 01:52:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPeb-0000000HPrL-0ie8
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:47:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2161eb95317so44558425ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736556424; x=1737161224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4h+oYTtB9STcgJt5s9KFyAqha4KcHVl9vU+KomymzjA=;
        b=bOGqELMmdQoRrTLaT7i4OBJ9SV2Y+0nOu+UYfPwPq+vSqn4T4kff9Ml/R3Uo7w0Cqh
         myI73bf8LShb0KGUuUf06pBD0NH5PSgVdVLnSojALr25R10ONhxqcXKJf+oU0atMTp4f
         l735/S07CcE77epRxHzCEC6aaKIu6S6Ax4Qw6YkB3+HeyPQV7PtJ4m5N50NGlmd+NX38
         J76HMNYCB2n2F8OQ4Gk9p9QFvexBFuJ0c5MTrC0FiU3cKxmcvLEgOstwpe7ndEMB/Ser
         73Ohw3rLjHEuNetCPCvbup+MqMyBwc9PoJGSYXRzoJBe+X3NrfC84bD6kMa3KixpfSln
         oMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556424; x=1737161224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h+oYTtB9STcgJt5s9KFyAqha4KcHVl9vU+KomymzjA=;
        b=TBN80IKktEYceyB94r0RAMZfTtjYkZHIpRVLZiBTyn4ILcqGprFYjU7UJCK1suXHOY
         PDanbgearJrj3h/b1kRzYV4v18FDnsOdyPtTv1r2tjAJdEvVG5U+XiqJxxz7flERa5DS
         Z8m8vwOBfR5uywuoolYkAoYglv87D4R15bOW8p9tHdCV2xnUI0/MNNhOZdXEVBSGXXXZ
         QVfjLk8YiedZcbIiDtc8phlOA4qMBVw6Ojd0e9wGFI4fsD8yGadOwRJEsgCd2zEdBexp
         6zQuDpSvV0KJm6M4IRHrbDXWXHtRiUEXQQVXQKNlGty4Z/XaOqwtAVBtEeM+Grv4lIBk
         Re6g==
X-Forwarded-Encrypted: i=1; AJvYcCWOWBFT/By5LUdtF2hFd7xYpFoypJ60PtQDVtW5kQbAq8r0f/dy/ZsqNclA7kjbSjW1ukPvhhFU3jM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzI1toN2U3guFy/vnHN7D+VvBeQiGhhWcOELUkwppg3zFFHiPBW
	G45Sp/LNVMCjPcGyUR5lZW6eNAnDb2NuJIr5LZN8XdD77FlW0/pVaOFdDTpDVGc=
X-Gm-Gg: ASbGnctrkh43PJRyDrzQ66iU0bgxNvgL+9ZrxUns73NIx9ugkUrzBDbXZchcA6OPdqK
	+vmkov4x7+qIqIcHO8OyaUa4fSS/wKN0HZkAx0GKrGHl+2tahsXedCtTHeJkMB5MSZv/FXj7fMS
	tDKsXV7V8OtdFTVDBi50Q/CrtQiifAIXyeSCgFgQBiwVnTbQ/do4D+WNQgW8b0+VEVES0HKZOSI
	XSZKdgjuxjDHYobhy2MVyDWt6xRIxyziiw/e898OKdszRlIuT6ORoKtn+Q9SpaK5FHMp/u0MkGU
	zls=
X-Google-Smtp-Source: AGHT+IHAZr0xNEPgPAWybCIes9Jl2csw7eIRzGzKkykORR+Jkm5P3UKWnrgjOIPEypC2vNZx8PlCXA==
X-Received: by 2002:a17:90b:2588:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2f548eae05amr18861868a91.11.1736556424149;
        Fri, 10 Jan 2025 16:47:04 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a28723esm6064295a91.19.2025.01.10.16.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 16:47:03 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] RISC-V: KVM: Pointer Masking Support
Date: Fri, 10 Jan 2025 16:46:57 -0800
Message-ID: <20250111004702.2813013-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_164705_228204_1531C68B 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBwb2ludGVyIG1hc2tpbmcgaW4gVlMtbW9kZSBp
bnNpZGUgS1ZNCmd1ZXN0cyB1c2luZyB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9uLiBUaGlzIHNlcmll
cyBhcHBsaWVzIG9uIHRvcCBvZgpDbMOpbWVudCdzICJyaXNjdjogYWRkIFNCSSBGV0ZUIG1pc2Fs
aWduZWQgZXhjZXB0aW9uIGRlbGVnYXRpb24gc3VwcG9ydCIKc2VyaWVzWzFdLCB3aGljaCBhZGRz
IHRoZSBuZWNlc3NhcnkgaW5mcmFzdHJ1Y3R1cmUuCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjUwMTA2MTU0ODQ3LjExMDAzNDQtMS1jbGVnZXJAcml2b3NpbmMu
Y29tLwoKClNhbXVlbCBIb2xsYW5kICgyKToKICBSSVNDLVY6IEtWTTogRml4IGluY2x1c2lvbiBv
ZiBTbW5wbSBpbiB0aGUgZ3Vlc3QgSVNBIGJpdG1hcAogIFJJU0MtVjogS1ZNOiBBZGQgc3VwcG9y
dCBmb3IgU0JJX0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOCgogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oIHwgIDIgKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYyAgICAgICAgICAgICAgIHwgODQgKysrKysrKysrKysrKystLS0tLS0tLQogYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jICAgICAgICAgICAgIHwgNzAgKysrKysrKysrKysrKysrKyst
CiAzIGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCi0t
IAoyLjQ3LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
