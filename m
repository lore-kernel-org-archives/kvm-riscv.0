Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E0E77188
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aLK/fK2ZyH88LaAN86ky0TehX02+lUVWLAOgrL6ngYU=; b=teHKlqDsL/+/8k
	PRXp9XoagdZ+nOIm4szA9Tx2aFK87i88o4gZnLfVqQsvhvEKgB7UHLq5yapGthSUK4RLy1bmmu1rC
	fLwSTgXtPLnXgozqLWhRLC23jqvxryftzpE8AQ2NrUQ+1Ar7LA0AMgN9vl+Qf5Fkd/IRZAreQkBSM
	rrHpzoVl6n4OrBmnLouxfSblo01PLnArffFHxlm6nUMpkljmwjhkPfl9/Xc6piOlu9eBiXJXnvLeN
	Q5dPvl0niEPVoObUI6OCjsHaV8x8YYKldFL+X+oqDcDSHTvWzcBBJHMqwEzA+BOrvAjmIjiyyTrn4
	rAJ6flCnWPLC4cPCcoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNb-00000001qTa-0C4g;
	Mon, 06 Jan 2025 15:50:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpLm-00000001q1G-2UxB
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21a1e6fd923so10668715ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178546; x=1736783346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GGpStBvhQ5K8XseHJPb5by+BUYzACgXmQyCH18qmBg=;
        b=auAx6zO6aTv6oJmuvIk4f62yPGDNMobd0nTuFX2D0IxsbajfOG0SVO9jVTtvg9Dltb
         XA8oZ+2xC87jX158thC8oNFrh2sziBZQQYODiyWy4X+1QMtDTBZuTwmw2goJVacim6AX
         zVTSx5RO80i306Jhc+qePcWq8kAXztdS1D7KbiIYaZn0eavsofmwLENihjZiVg9jGGEs
         wB3iNwLfCo7Y4q2cBGRCfmtzcc8DuelI+aavlez0H7icizw/lqdyObLKjOVh7JD1VtLp
         NBxOwcKXgcBQHNthpT98BF7zm3Y+o/pOD1+WjfIMPYgYaK/dB0drix49L83PFVNmG9y4
         Fb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178546; x=1736783346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GGpStBvhQ5K8XseHJPb5by+BUYzACgXmQyCH18qmBg=;
        b=sHnGT+0uUGcflkSH/YLDPKL3w914ebFYiXCPgr+8gHymHG+HKsoFiT/z5G+nMhIRHP
         8M+ITNdcqAp/I1ugAOmNhZQH/6tnXzH0pfFaJLw+FdzYan0aWkvB9nvHneqXqz1fLy5Z
         LhvkFN/VVfFYlxR7DIZwqBsVMStrJCZSlRDPkDRuw0bCS7KiWu484bM3jqxIs6yfT4DT
         8cp7WVIq09YLLMSB1EwOpfPyozh8ZrgLgoziNXv/j0uPDwsWi8IiICHQvpDkXnxNqftB
         4nF8zDhw+4F3MvbUSPMFPnK3NwBhBIBMXI/l81Fr4annW+M0v+nuenkEhpT/uegyYWbp
         mzEw==
X-Forwarded-Encrypted: i=1; AJvYcCUD2oBmDsfdilpuFQhQ5W6hGbX3M2o/esC+IxliY3R3gs8tgDcOujBs45HFl4cwfK1l8nmnbtTdMu4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjf85Jmy9jev2eOsMBns2K+78M3/hWCESetNUUSE4n8aNR3Fhu
	YRlZle+5L1VyHDhnOqy4h1ipuRSxJuNZBOg5sVAVoRhqTQ5WCUfJOP+gXia/Ick=
X-Gm-Gg: ASbGncsAc9Huzm4zilOVWvXDonDSjCDpw55gaw+2eLs3NSkPYkmktH3Rj1FOI+o+OVz
	JO8TCLFPH17Z+7ZogEdh6T0wMQ59JjiurqWy/rZf42EBTc5rAkX2MW5zLBHCKUR0Q6aZvFXzgew
	CfEDopVsk5gntKzgEoqXYAvnu2SDYidEQFE8jeNcG/0yY/41xpHKgwDSzYIt0Ra+1Ca2nHjlG+V
	tc+HUHHREB5YESH2bnzyKoQgosUj3+yoxMh1wooGT9JJ2FQOgvdSwR5Xg==
X-Google-Smtp-Source: AGHT+IEPJYkB+GjJZ58TJzg7jlP2DmeS3NY6LvjoJXuDWaiGaC9bRpxjyB6+IigEUT+Axr/d/VfYnA==
X-Received: by 2002:a17:90b:2752:b0:2ee:fdf3:38ea with SMTP id 98e67ed59e1d1-2f452ec714amr77626971a91.23.1736178545785;
        Mon, 06 Jan 2025 07:49:05 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:05 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 0/6] riscv: add SBI FWFT misaligned exception delegation support
Date: Mon,  6 Jan 2025 16:48:37 +0100
Message-ID: <20250106154847.1100344-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074906_790365_56953513 
X-CRM114-Status: GOOD (  13.09  )
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

VGhlIFNCSSBGaXJtd2FyZSBGZWF0dXJlIGV4dGVuc2lvbiBhbGxvd3MgdGhlIFMtbW9kZSB0byBy
ZXF1ZXN0IHNvbWUKc3BlY2lmaWMgZmVhdHVyZXMgKGVpdGhlciBoYXJkd2FyZSBvciBzb2Z0d2Fy
ZSkgdG8gYmUgZW5hYmxlZC4gVGhpcwpzZXJpZXMgdXNlcyB0aGlzIGV4dGVuc2lvbiB0byByZXF1
ZXN0IG1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbgpkZWxlZ2F0aW9uIHRvIFMtbW9kZSBpbiBv
cmRlciB0byBsZXQgdGhlIGtlcm5lbCBoYW5kbGUgaXQuIEl0IGFsc28gYWRkcwpzdXBwb3J0IGZv
ciB0aGUgS1ZNIEZXRlQgU0JJIGV4dGVuc2lvbiBiYXNlZCBvbiB0aGUgbWlzYWxpZ25lZCBhY2Nl
c3MKaGFuZGxpbmcgaW5mcmFzdHJ1Y3R1cmUuCgpGV0ZUIFNCSSBleHRlbnNpb24gaXMgcGFydCBv
ZiB0aGUgU0JJIFYzLjAgc3BlY2lmaWNhdGlvbnMgWzFdLiBJdCBjYW4gYmUKdGVzdGVkIHVzaW5n
IHRoZSBxZW11IHByb3ZpZGVkIGF0IFsyXSB3aGljaCBjb250YWlucyB0aGUgc2VyaWVzIGZyb20K
WzNdLiBrdm0tdW5pdC10ZXN0cyBbNF0gY2FuIGJlIHVzZWQgaW5zaWRlIGt2bSB0byB0ZXN0cyB0
aGUgY29ycmVjdApkZWxlZ2F0aW9uIG9mIG1pc2FsaWduZWQgZXhjZXB0aW9ucy4gVXBzdHJlYW0g
T3BlblNCSSBjYW4gYmUgdXNlZC4KClRoZSB0ZXN0IGNhbiBiZSBydW4gdXNpbmcgYSBzbWFsbCB1
dGlsaXR5WzVdIGFzIHdlbGwgYXMgdXNpbmcga3ZtLXRvb2xzOgoKJCBxZW11LXN5c3RlbS1yaXNj
djY0IFwKCS1jcHUgcnY2NCx0cmFwLW1pc2FsaWduZWQtYWNjZXNzPXRydWUsdj10cnVlIFwKCS1N
IHZpcnQgXAoJLW0gMTAyNE0gXAoJLWJpb3MgZndfZHluYW1pYy5iaW4gXAoJLWtlcm5lbCBJbWFn
ZQogLi4uCgogIyAuL3VuYWxpZ25lZAogQnVmIGJhc2UgYWRkcmVzczogMHg1NTU1NzU2ZmYwZjAK
IFRlc3RpbmcgZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2l6ZSAyLCBvZmZzZXQgMQog
VGVzdGluZyBub24tZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2l6ZSAyLCBvZmZzZXQg
MQogVGVzdGluZyBlbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBzaXplIDQsIG9mZnNldCAx
CiBUZXN0aW5nIG5vbi1lbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBzaXplIDQsIG9mZnNl
dCAxCiBUZXN0aW5nIGVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzZXMsIHNpemUgNCwgb2Zmc2V0
IDIKIFRlc3Rpbmcgbm9uLWVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzZXMsIHNpemUgNCwgb2Zm
c2V0IDIKIFRlc3RpbmcgZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2l6ZSA0LCBvZmZz
ZXQgMwogVGVzdGluZyBub24tZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2l6ZSA0LCBv
ZmZzZXQgMwogVGVzdGluZyBlbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBzaXplIDgsIG9m
ZnNldCAxCiBUZXN0aW5nIG5vbi1lbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBzaXplIDgs
IG9mZnNldCAxCiBUZXN0aW5nIGVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzZXMsIHNpemUgOCwg
b2Zmc2V0IDIKIFRlc3Rpbmcgbm9uLWVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzZXMsIHNpemUg
OCwgb2Zmc2V0IDIKIFRlc3RpbmcgZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2l6ZSA4
LCBvZmZzZXQgMwogVGVzdGluZyBub24tZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywgc2l6
ZSA4LCBvZmZzZXQgMwogVGVzdGluZyBlbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBzaXpl
IDgsIG9mZnNldCA0CiBUZXN0aW5nIG5vbi1lbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBz
aXplIDgsIG9mZnNldCA0CiBUZXN0aW5nIGVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzZXMsIHNp
emUgOCwgb2Zmc2V0IDUKIFRlc3Rpbmcgbm9uLWVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzZXMs
IHNpemUgOCwgb2Zmc2V0IDUKIFRlc3RpbmcgZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nlcywg
c2l6ZSA4LCBvZmZzZXQgNgogVGVzdGluZyBub24tZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Nl
cywgc2l6ZSA4LCBvZmZzZXQgNgogVGVzdGluZyBlbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2Vz
LCBzaXplIDgsIG9mZnNldCA3CiBUZXN0aW5nIG5vbi1lbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2Vz
c2VzLCBzaXplIDgsIG9mZnNldCA3CgogIyBsa3ZtIHJ1biAtayBzYmkuZmxhdCAtbSAxMjgKICBJ
bmZvOiAjIGxrdm0gcnVuIC1rIHNiaS5mbGF0IC1tIDEyOCAtYyAxIC0tbmFtZSBndWVzdC05Nwog
IEluZm86IFJlbW92ZWQgZ2hvc3Qgc29ja2V0IGZpbGUgIi9yb290Ly5sa3ZtLy9ndWVzdC05Ny5z
b2NrIi4KCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogIyAgICBrdm0tdW5pdC10ZXN0cwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKCiAuLi4gW3Rlc3QgbWVzc2FnZXMgZWxpZGVkXQogUEFTUzogc2JpOiBmd2Z0OiBG
V0ZUIGV4dGVuc2lvbiBwcm9iaW5nIG5vIGVycm9yCiBQQVNTOiBzYmk6IGZ3ZnQ6IGdldC9zZXQg
cmVzZXJ2ZWQgZmVhdHVyZSAweDYgZXJyb3IgPT0gU0JJX0VSUl9ERU5JRUQKIFBBU1M6IHNiaTog
ZndmdDogZ2V0L3NldCByZXNlcnZlZCBmZWF0dXJlIDB4M2ZmZmZmZmYgZXJyb3IgPT0gU0JJX0VS
Ul9ERU5JRUQKIFBBU1M6IHNiaTogZndmdDogZ2V0L3NldCByZXNlcnZlZCBmZWF0dXJlIDB4ODAw
MDAwMDAgZXJyb3IgPT0gU0JJX0VSUl9ERU5JRUQKIFBBU1M6IHNiaTogZndmdDogZ2V0L3NldCBy
ZXNlcnZlZCBmZWF0dXJlIDB4YmZmZmZmZmYgZXJyb3IgPT0gU0JJX0VSUl9ERU5JRUQKIFBBU1M6
IHNiaTogZndmdDogbWlzYWxpZ25lZF9kZWxlZzogR2V0IG1pc2FsaWduZWQgZGVsZWcgZmVhdHVy
ZSBubyBlcnJvcgogUEFTUzogc2JpOiBmd2Z0OiBtaXNhbGlnbmVkX2RlbGVnOiBTZXQgbWlzYWxp
Z25lZCBkZWxlZyBmZWF0dXJlIGludmFsaWQgdmFsdWUgZXJyb3IKIFBBU1M6IHNiaTogZndmdDog
bWlzYWxpZ25lZF9kZWxlZzogU2V0IG1pc2FsaWduZWQgZGVsZWcgZmVhdHVyZSBpbnZhbGlkIHZh
bHVlIGVycm9yCiBQQVNTOiBzYmk6IGZ3ZnQ6IG1pc2FsaWduZWRfZGVsZWc6IFNldCBtaXNhbGln
bmVkIGRlbGVnIGZlYXR1cmUgdmFsdWUgbm8gZXJyb3IKIFBBU1M6IHNiaTogZndmdDogbWlzYWxp
Z25lZF9kZWxlZzogU2V0IG1pc2FsaWduZWQgZGVsZWcgZmVhdHVyZSB2YWx1ZSAwCiBQQVNTOiBz
Ymk6IGZ3ZnQ6IG1pc2FsaWduZWRfZGVsZWc6IFNldCBtaXNhbGlnbmVkIGRlbGVnIGZlYXR1cmUg
dmFsdWUgbm8gZXJyb3IKIFBBU1M6IHNiaTogZndmdDogbWlzYWxpZ25lZF9kZWxlZzogU2V0IG1p
c2FsaWduZWQgZGVsZWcgZmVhdHVyZSB2YWx1ZSAxCiBQQVNTOiBzYmk6IGZ3ZnQ6IG1pc2FsaWdu
ZWRfZGVsZWc6IFZlcmlmeSBtaXNhbGlnbmVkIGxvYWQgZXhjZXB0aW9uIHRyYXAgaW4gc3VwZXJ2
aXNvcgogU1VNTUFSWTogNTAgdGVzdHMsIDIgdW5leHBlY3RlZCBmYWlsdXJlcywgMTIgc2tpcHBl
ZAoKVGhpcyBzZXJpZXMgaXMgYXZhaWxhYmxlIGF0IFs2XS4KCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMvZG93bmxvYWQvdnYzLjAt
cmMyL3Jpc2N2LXNiaS5wZGYgWzFdCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9x
ZW11L3RyZWUvZGV2L2NsZWdlci9taXNhbGlnbmVkIFsyXQpMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDEyMTEyMTE5MzMuMTk4NzkyLTMtZmtvbnJhZEBhbWQuY29tL1QvIFsz
XQpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vY2xlbWVudGxlZ2VyL2t2bS11bml0LXRlc3RzL3Ry
ZWUvZGV2L2NsZWdlci9md2Z0X3YxIFs0XQpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vY2xlbWVu
dGxlZ2VyL3VuYWxpZ25lZF90ZXN0IFs1XQpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcml2b3Np
bmMvbGludXgvdHJlZS9kZXYvY2xlZ2VyL2Z3ZnRfdjEgWzZdCi0tLQoKQ2zDqW1lbnQgTMOpZ2Vy
ICg2KToKICByaXNjdjogYWRkIEZpcm13YXJlIEZlYXR1cmUgKEZXRlQpIFNCSSBleHRlbnNpb25z
IGRlZmluaXRpb25zCiAgcmlzY3Y6IHJlcXVlc3QgbWlzYWxpZ25lZCBleGNlcHRpb24gZGVsZWdh
dGlvbiBmcm9tIFNCSQogIFJJU0MtVjogS1ZNOiBhZGQgU0JJIGV4dGVuc2lvbiBpbml0KCkvZGVp
bml0KCkgZnVuY3Rpb25zCiAgUklTQy1WOiBLVk06IGFkZCBzdXBwb3J0IGZvciBGV0ZUIFNCSSBl
eHRlbnNpb24KICByaXNjdjogZXhwb3J0IHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKCkgYXMgYSBH
UEwgc3ltYm9sCiAgUklTQy1WOiBLVk06IGFkZCBzdXBwb3J0IGZvciBTQklfRldGVF9NSVNBTElH
TkVEX0RFTEVHCgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgIHwg
ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgICB8ICAgNCAr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oICAgICAgfCAgMTAgKwogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oIHwgIDM3ICsrKysKIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmggICAgICAgICAgICAgICB8ICAyOCArKysKIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2tl
cm5lbC90cmFwc19taXNhbGlnbmVkLmMgICAgICAgfCAgNjEgKysrKysrCiBhcmNoL3Jpc2N2L2tl
cm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAgIDIgKwogYXJjaC9yaXNjdi9rdm0vTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAg
ICAgICAgICAgICAgICAgfCAgMzUgKysrLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5j
ICAgICAgICAgICAgIHwgMjE1ICsrKysrKysrKysrKysrKysrKysrKwogMTIgZmlsZXMgY2hhbmdl
ZCwgMzk5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKCi0tIAoyLjQ3LjEKCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
