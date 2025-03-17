Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CFC282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xaJLsdPZCCwsvufTWimj7OYs63F6HhKILkWIUHkC01Q=; b=Qkz/R72URm/qPV
	xnt7AQQWLY8/ooPEGZZdoaW7BtXR9fEfeJUNaQKfDTs4m8jc44kOXLzFZZSa5osJbWgZtK1svuSug
	HgaidV07Db5iQRijORC8aeABqJhCQ0mDfpfsmV8XjhRBRFyx7mBX5goK2uxt7gQAaAVOuuBHezE6v
	L2LIdk1CCLDJj4Rkb2qA/WE1pawglOBSIqWshvU97DmXD7Xe06CGH1NDfMlTi+/kef26XlBPwBLUn
	LzuVtUq2eDr5KlWWS00h/ZM74IV2+17gW/BmluxVl6KtfeHCF34x1KwZToTz5s8NqiOiJuphx4Zv7
	YmOCQtRc/XH56lHT5VTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gE-000000028uT-1UhJ;
	Mon, 17 Mar 2025 10:26:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Zr-000000026xO-2txy
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:20:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43948021a45so20360885e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742206810; x=1742811610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7YMV+JZ6BIdacMpDlgwQ3lr6Io+aBiXLOqXA4jr1cs=;
        b=LOOgGYQLsgs8K5MuKoyq88vjODbDoymAHFVa0zQOZVYfvTUxWqrJ+RtKah8bIrcggX
         XEbN+NQWj8BvkX4uB+66q7vWsa//6LL+BYWoXNAdeeylamJQY6jArZg440iATrDsMhSi
         WuD5/TUtTcNeEVjwoaBVSNV70xhwiBSNCl0/PzKECz/mUXZjnqhYgvcHxEpN0MK73Rfh
         MKHP9jbG29SDN3YxcbF3FDIzg8jRt7TjbCAZ9TdSR8xJk72y7QX0dQhkDRlna+PyheY5
         hhuIovTdr1rEi5iK9rbruooBOQU6l9euMbt+uZLtJNHCY17V7ST/vGxv+aFWPdp8tkUI
         Dgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206810; x=1742811610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7YMV+JZ6BIdacMpDlgwQ3lr6Io+aBiXLOqXA4jr1cs=;
        b=HufiTWBvFXaYzeqbGMIpPuISxWfz06PF4Pk3znbJ9dCH00frznFrSvIAUyWJwCCTcZ
         1jGbzFJrHa+d2lU4pBHNAe2uV6jbwp7I4XGQxy406InUSHSKcLKcmIx6PaEqo9a1BWOn
         B6lFEML8FYdaWh311W0MV5yGv3LviyjZw5S7FwCwZjYqF41rmsDv4irVYnt7Jx2590tZ
         Q6lN3V4V6hoYSU0KsBVfSAU3WEPQbbz5q6L5oIXZC8JsbOe7vwgP8IjeGXBQE8JgaHVV
         cCBGda7XDmoMmmLHVYrQqih7TY+VtFjMhyLKud0T5ug3odeuwFQ6EfXMaPP7oniSGPqY
         5G9g==
X-Forwarded-Encrypted: i=1; AJvYcCWIrCDc1O41CMrmHLewbW0WINb6KX67tNb78D7r8Edj3Nk1hGVqgaTmp+kozSMZyWhgf11qifuAj7s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKkIV9mzWzLdWlW1TXxtG+TBZ5V5QZ3Pdm90UOkIsY9TzRmmCE
	uPW7dMl7XXdULmRGD43tkNSmXRrgYVLh4gV291Gq4/p6ccyzVN9Zjcdxa41tcow=
X-Gm-Gg: ASbGnctKBs07NT3ZBN1XksV4tIgM7f3tdS23Q/Ndag03FFF413xCZFvGGZlg4CCh+Wi
	LjCq57yRDF1NVPWB0EdvCD4sile+SCAM1jesH/C4zrJfr8Z77Y0zfolge86YWX0rlcTAxKEqPEP
	/V1JQoAWjVFfcHRl37mlN2kDYb8z98jFrOc3cwjHTuwV148rQ+3IBeUBLyhB2iqPSavW7l/c/43
	x0iwv4EWbMinfY6LkdtVTm5sPIiSUsIATGZWY1kFgYyRUc1+cDiUayBkUTUUrB/R/WnG7KsKeCT
	UYetaOykysNwkfbrEWC6tWizxOORxIt0xPtkdWnWbfPdbQ==
X-Google-Smtp-Source: AGHT+IGB0yHt2wBIw/462+iVCrcdpb1AXU0/1jVzuJx2gVAvTV2tfhGeP63NL8dy7sY2qzSw+SbxPQ==
X-Received: by 2002:a05:6000:1acc:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-3971f7fa1e8mr11120342f8f.44.1742206809700;
        Mon, 17 Mar 2025 03:20:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm14749824f8f.99.2025.03.17.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:20:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v10 0/8] riscv: add SBI SSE extension tests
Date: Mon, 17 Mar 2025 11:19:46 +0100
Message-ID: <20250317101956.526834-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032012_015398_5BC245A0 
X-CRM114-Status: GOOD (  16.20  )
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

VGhpcyBzZXJpZXMgYWRkcyB0ZXN0cyBmb3IgU0JJIFNTRSBleHRlbnNpb24gYXMgd2VsbCBhcyBu
ZWVkZWQKaW5mcmFzdHJ1Y3R1cmUgZm9yIFNTRSBzdXBwb3J0LiBJdCBhbHNvIGFkZHMgdGVzdCBz
cGVjaWZpYyBhc20tb2Zmc2V0cwpnZW5lcmF0aW9uIHRvIHVzZSBjdXN0b20gT0ZGU0VUIGFuZCBE
RUZJTkUgZnJvbSB0aGUgdGVzdCBkaXJlY3RvcnkuCgpUaGVzZSB0ZXN0cyBjYW4gYmUgcnVuIHVz
aW5nIGFuIE9wZW5TQkkgdmVyc2lvbiB0aGF0IGltcGxlbWVudHMgbGF0ZXN0CnNwZWNpZmljYXRp
b25zIG1vZGlmaWNhdGlvbiBbMV0KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9v
cGVuc2JpL3RyZWUvZGV2L2NsZWdlci9zc2UgWzFdCgotLS0KClYxMDoKIC0gVXNlICYmIGluc3Rl
YWQgb2YgfHwgZm9yIHRpbWVvdXQgaGFuZGxpbmcKIC0gQWRkIFNCSSBwYXRjaGVzIHdoaWNoIGlu
dHJvZHVjZSBmdW5jdGlvbiB0byBnZXQgaW1wbGVtZW50ZXIgSUQgYW5kCiAgIHZlcnNpb24gYXMg
d2VsbCBhcyBpbXBsZW1lbnRlciBJRCBkZWZpbmVzLgogLSBTa2lwIGluamVjdGlvbiB0ZXN0cyBp
biBPcGVuU0JJIDwgdjEuNgoKVjk6CiAtIFVzZSBfX0FTU0VNQkxFUl9fIGluc3RlYWQgb2YgX19B
U1NFTUJMWV9fCiAtIFJlbW92ZSBleHRyYSBzcGFjZXMKIC0gVXNlIGFzc2VydCB0byBjaGVjayBn
bG9iYWwgZXZlbnQgaW4KICAgc3NlX2dsb2JhbF9ldmVudF9zZXRfY3VycmVudF9oYXJ0KCkKIC0g
VGFidWxhdGUgU1NFIGV2ZW50cyBuYW1lcyB0YWJsZQogLSBVc2Ugc2JpX3NzZV9yZWdpc3Rlcigp
IGluc3RlYWQgb2Ygc2JpX3NzZV9yZWdpc3Rlcl9yYXcoKSBpbiBlcnJvcgogICB0ZXN0aW5nCiAt
IE1vdmUgYSByZXBvcnRfcGFzcygpIG91dCBvZiBlcnJvciBwYXRoCiAtIFJld29yayBhbGwgaW5q
ZWN0aW9uIHRlc3RzIHdpdGggYmV0dGVyIGVycm9yIGhhbmRsaW5nCiAtIFVzZSBhbiBlbnYgdmFy
IGZvciBzc2UgZXZlbnQgY29tcGxldGlvbiB0aW1lb3V0CiAtIEFkZCB0aW1lb3V0IGZvciBzb21l
IHBvdGVudGlhbGx5IGluZmluaXRlIHdoaWxlKCkgbG9vcHMKClY4OgogLSBTaG9ydCBjaXJjdWl0
IGN1cnJlbnQgZXZlbnQgdGVzdHMgaWYgZmFpbHVyZSBoYXBwZW5zCiAtIFJlbW92ZSBTU0UgZnJv
bSBhbGwgcmVwb3J0IHN0cmluZ3MKIC0gSW5kZW50IC5wcmlvIGZpZWxkCiAtIEFkZCBjcHVfcmVs
YXgoKS9zbXBfcm1iKCkgd2hlcmUgbmVlZGVkCiAtIEFkZCB0aW1lb3V0IGZvciBnbG9iYWwgZXZl
bnQgRU5BQkxFRCBzdGF0ZSBjaGVjawogLSBBZGRlZCBCSVQoMzIpIGFsaWFzZXMgdGVzdHMgZm9y
IGF0dHJpYnV0ZS9ldmVudF9pZC4KClY3OgogLSBUZXN0IGlkcy9hdHRyaWJ1dGVzL2F0dHJpYnV0
ZXMgY291bnQgPiAzMiBiaXRzCiAtIFJlbmFtZSBhbGwgU1NFIGZ1bmN0aW9uIHRvIHNiaV9zc2Vf
KgogLSBVc2UgZXZlbnRfaWQgaW5zdGVhZCBvZiBldmVudC9ldnQKIC0gRmFjdG9yaXplIHJlYWQv
d3JpdGUgdGVzdAogLSBVc2UgdmlydF90b19waHlzKCkgZm9yIGF0dHJpYnV0ZXMgcmVhZC93cml0
ZS4KIC0gRXh0ZW5zaXZlbHkgdXNlIHNiaXJldF9yZXBvcnRfZXJyb3IoKQogLSBDaGFuZ2UgY2hl
Y2sgZnVuY3Rpb24gcmV0dXJuIHZhbHVlcyB0byBib29sLgogLSBBZGRlZCBhc3NlcnQgZm9yIHN0
YWNrIHNpemUgdG8gYmUgYmVsb3cgb3IgZXF1YWwgdG8gUEFHRV9TSVpFCiAtIFVzZSBlbiBlbnYg
dmFyaWFibGUgZm9yIHRoZSBtYXhpbXVtIGhhcnQgSUQKIC0gQ2hlY2sgdGhhdCBpbmRpdmlkdWFs
IHJlYWQgZnJvbSBhdHRyaWJ1dGVzIG1hdGNoZXMgdGhlIG11bHRpcGxlCiAgIGF0dHJpYnV0ZXMg
cmVhZC4KIC0gQWRkZWQgbXVsdGlwbGUgYXR0cmlidXRlcyB3cml0ZSBhdCBvbmNlCiAtIFVzZWQg
UkVBRF9PTkNFL1dSSVRFX09OQ0UKIC0gSW5qZWN0IGFsbCBsb2NhbCBldmVudCBhdCBvbmNlIHJh
dGhlciB0aGFuIGxvb3BpbmcgZm9wciBlYWNoIGNvcmUuCiAtIFNwbGl0IHRlc3RfYXJnIGZvciBs
b2NhbF9kaXNwYXRjaCB0ZXN0IHNvIHRoYXQgYWxsIENQVXMgY2FuIHJ1biBhdAogICBvbmNlLgog
LSBNb3ZlIFNTRSBlbnRyeSBhbmQgZ2VuZXJpYyBjb2RlIHRvIGxpYi9yaXNjdiBmb3Igb3RoZXIg
dGVzdHMKIC0gRml4IHVubWFzay9tYXNrIHN0YXRlIGNoZWNraW5nCgpWNjoKIC0gQWRkIG1pc3Np
bmcgJChnZW5lcmF0ZWQtZmlsZSkgZGVwZW5kZW5jaWVzIGZvciAiLWRlcHMiIG9iamVjdHMKIC0g
U3BsaXQgU1NFIGVudHJ5IGZyb20gc2JpLWFzbS5TIHRvIHNzZS1hc20uUyBhbmQgYWxsIFNTRSBj
b3JlIGZ1bmN0aW9ucwogICBzaW5jZSBpdCB3aWxsIGJlIHVzZWZ1bCBmb3Igb3RoZXIgdGVzdHMg
YXMgd2VsbCAoZGJsdHJwKS4KClY1OgogLSBVcGRhdGUgZXZlbnQgcmFuZ2VzIGJhc2VkIG9uIGxh
dGVzdCBzcGVjCiAtIFJlbmFtZSBhc20tb2Zmc2V0LXRlc3QuYyB0byBzYmktYXNtLW9mZnNldC5j
CgpWNDoKIC0gRml4IHR5cG8gc2JpX2V4dF9zc19maWQgLT4gc2JpX2V4dF9zc2VfZmlkCiAtIEFk
ZCBwcm9wZXIgYXNtLW9mZnNldCBnZW5lcmF0aW9uIGZvciB0ZXN0cwogLSBNb3ZlIFNTRSBzcGVj
aWZpYyBmaWxlIGZyb20gbGliL3Jpc2N2IHRvIHJpc2N2LwoKVjM6CiAtIEFkZCAtZGVwcyB2YXJp
YWJsZSBmb3IgdGVzdCBzcGVjaWZpYyBkZXBlbmRlbmNpZXMKIC0gRml4IGZvcm1hdHRpbmcgZXJy
b3JzL3R5cG8gaW4gc2JpLmgKIC0gQWRkIG1pc3NpbmcgZG91YmxlIHRyYXAgZXZlbnQKIC0gQWxw
aGFiZXRpemUgc2JpLXNzZS5jIGluY2x1ZGVzCiAtIEZpeCBhNiBjb250ZW50IGFmdGVyIHVubWFz
a2luZyBldmVudAogLSBBZGQgU1NFIEhBUlRfTUFTSy9VTk1BU0sgdGVzdAogLSBVc2UgbXYgaW5z
dGVhZCBvZiBtb3ZlCiAtIG1vdmUgc2JpX2NoZWNrX3NzZSgpIGRlZmluaXRpb24gaW4gc2JpLmMK
IC0gUmVtb3ZlIHNiaV9zc2UgdGVzdCBmcm9tIHVuaXRlc3RzLmNmZwoKVjI6CiAtIFJlYmFzZWQg
b24gb3JpZ2luL21hc3RlciBhbmQgaW50ZWdyYXRlIGl0IGludG8gc2JpLmMgdGVzdHMKCkNsw6lt
ZW50IEzDqWdlciAoOCk6CiAga2J1aWxkOiBBbGxvdyBtdWx0aXBsZSBhc20tb2Zmc2V0cyBmaWxl
IHRvIGJlIGdlbmVyYXRlZAogIHJpc2N2OiBTZXQgLmF1eC5vIGZpbGVzIGFzIC5QUkVDSU9VUwog
IHJpc2N2OiBVc2UgYXNtLW9mZnNldHMgdG8gZ2VuZXJhdGUgU0JJX0VYVF9IU00gdmFsdWVzCiAg
cmlzY3Y6IHNiaTogQWRkIGZ1bmN0aW9ucyBmb3IgdmVyc2lvbiBjaGVja2luZwogIGxpYjogcmlz
Y3Y6IGFkZCBmdW5jdGlvbnMgdG8gZ2V0IGltcGxlbWVudGVyIElEIGFuZCB2ZXJzaW9uCiAgcmlz
Y3Y6IGxpYjogQWRkIFNCSSBTU0UgZXh0ZW5zaW9uIGRlZmluaXRpb25zCiAgbGliOiByaXNjdjog
QWRkIFNCSSBTU0Ugc3VwcG9ydAogIHJpc2N2OiBzYmk6IEFkZCBTU0UgZXh0ZW5zaW9uIHRlc3Rz
Cgogc2NyaXB0cy9hc20tb2Zmc2V0cy5tYWsgfCAgIDIyICstCiByaXNjdi9NYWtlZmlsZSAgICAg
ICAgICB8ICAgIDUgKy0KIGxpYi9yaXNjdi9hc20vY3NyLmggICAgIHwgICAgMSArCiBsaWIvcmlz
Y3YvYXNtL3NiaS5oICAgICB8ICAxODcgKysrKystCiBsaWIvcmlzY3Yvc2JpLXNzZS1hc20uUyB8
ICAxMDIgKysrKwogbGliL3Jpc2N2L2FzbS1vZmZzZXRzLmMgfCAgICA5ICsKIGxpYi9yaXNjdi9z
YmkuYyAgICAgICAgIHwgICA5NSArKy0KIHJpc2N2L3NiaS10ZXN0cy5oICAgICAgIHwgICAgMSAr
CiByaXNjdi9zYmktYXNtLlMgICAgICAgICB8ICAgIDYgKy0KIHJpc2N2L3NiaS1hc20tb2Zmc2V0
cy5jIHwgICAxMSArCiByaXNjdi9zYmktc3NlLmMgICAgICAgICB8IDEyODAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiByaXNjdi9zYmkuYyAgICAgICAgICAgICB8ICAg
IDIgKwogcmlzY3YvLmdpdGlnbm9yZSAgICAgICAgfCAgICAxICsKIDEzIGZpbGVzIGNoYW5nZWQs
IDE3MDkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
bGliL3Jpc2N2L3NiaS1zc2UtYXNtLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktYXNt
LW9mZnNldHMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L3NiaS1zc2UuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHJpc2N2Ly5naXRpZ25vcmUKCi0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
