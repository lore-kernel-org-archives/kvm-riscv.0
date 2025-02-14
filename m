Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE0FC02198
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XZKZPWl/cqA36bPxxT5GTqIk6RC680LaR9KOqIMhiyo=; b=FcVDjIwB+j7iFN
	cAZso8pK3dmrpnUZPzwLzvVzGKsXEKbkK/PJbL37gvqIfUR/ZxdD03cvjgrahAcd0vkB0b9E5euxW
	wNzYQq52FB28isNH68abOB762O4oNDkXYsqEIWrjb7ug7LSgk7PdLKOK0yUwa/JVHrS4F2//q+Gs5
	cf0XSjkbSAtYiKdgOQxt7Z7ZXqNU3MI3z7VQWMdL0ED2G8MrpDgNw+NoC2BBMyp8oBG9VdPFuyRsx
	61WsCeWF2bGjEAYLrM8Xzvp1RKAVuqJY7ucoX3eSbb3ocDARzy8Oa07gyfv9DGcXkKojCGivFsjDu
	TuCGxFBqNy4pC4luYaXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuEg-0000000EkZp-1Gqs;
	Fri, 14 Feb 2025 11:51:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu7k-0000000EivO-12mR
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:44:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f441791e40so2834066a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739533487; x=1740138287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTZ1eswZXwVwVz8vwigYFoyZQAJNHhwum6Jps7FH7Ec=;
        b=CHkRycAtgni4r/FW6aBxsuLDLUeJfdnEg9oJwEAakjTp25MgBij3VZpNtvCIi7iu/z
         ws2fVpVE3DX1ezLDxGHmAXD/qmth+NR0SuLYkj79AR55kH3bX/0YC91S2IfxxlWevEp3
         Px4vlkw661NEqOWZN4pqxpkZ1Uf4bsBcVAjx73bLXIjjwxatCrQlS2zwjiCUd+qGWEmY
         Rd1cAH8Zsj8j00aV7XnwJtFsXc0KHSqUneIJDvM3eJwzUsggxCWx0SJC31FT6skrGhRW
         +Xe/s+aMtUfbdnOyc17SRwE7dpP5kxHEltLw8dylRo8R2F+fspmeCKdjuI5zLMpCOeHh
         5fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533487; x=1740138287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTZ1eswZXwVwVz8vwigYFoyZQAJNHhwum6Jps7FH7Ec=;
        b=BxN4J8yx4S5oDGXd3jOM9CLnuKw8tGKQByYp1rb9eLSvC3Wn+Dd1tN2WmukGTTqta7
         XjxOAgpYCG+Cqd6soK9XMjlwSv/AJYuyQQucJyAmXgmAKFc/Ual+z2YMZd/OtMS+gP2q
         w+WOK5d6JU1UsARnHRzGIdCH/PLAEICpHD+ZC6c7e2R82Bo1fjFwwqcxgAMIXOh1/vDP
         Bgi+NSeltT28ZOmb4GvPnSgmvtHB8uM+5qMiF6oANrAyaDhENiYbFjyffBpZmFmTRr57
         xo9D7DlF7xfFBZfASKPxWq0eUkWfnqWDLZGOWHDFfxL6o/CirtIe1a01toUMjM3n2TXi
         5q6A==
X-Forwarded-Encrypted: i=1; AJvYcCUYxg3fqR9FxwpFMXjGbuRhoh+QA9aH5+pfzRAOVE1ddr3UgU3TKJODq9KztX+i10ZvTrwiLxqpsXo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZa5epHzWT7P36wHPtGQC6C+R0c1tjamPjrJhUYIxQmbYyaA3
	Pk0T0wCXG6jiLttaoOeQaIYSp8fTwcxz/Y2jef1h3bVMcR6NKp4vebCVMM2LEeg=
X-Gm-Gg: ASbGncvRIg6BzDhdPXgh3wkLrwvFxYR+Au/ReWoX9cTZXaP+VCUPhUzp1wbBrCT69mL
	VzBCIcb9OyzF8NIsADblJZpJ/Cz5eA3B0QKqpaWFxv2kYute6T1hSKK+vRe85DNq7+YPqeMfFF8
	TIPGbhTCEejC3zKfHiwXc3SdvfmrOzKJjxEhYddSIsTaP8+vFT/wL5uAsImJPhGuio0dRH6Hlgb
	A7/O2JXtFZMdNgHaHMH1l2CVTx6DBc05OagqXTjXqDoapil+vQwdWk/89MG9miZtbGHlXPnAsZl
	25HrhCqbo6Yuf7IE
X-Google-Smtp-Source: AGHT+IHMJlRt+CJQtQ5FBvjSw8s0xL5dZPLJ6OoNwbaMnPzogi0MHb8vLEtn3RtAM95ptkeGqjkq0g==
X-Received: by 2002:a17:90b:2d46:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2fbf5c009e7mr19113938a91.14.1739533487435;
        Fri, 14 Feb 2025 03:44:47 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f6965sm4948862a91.29.2025.02.14.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:44:46 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v7 0/6] riscv: add SBI SSE extension tests
Date: Fri, 14 Feb 2025 12:44:13 +0100
Message-ID: <20250214114423.1071621-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_034448_475078_50325454 
X-CRM114-Status: GOOD (  13.86  )
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

VGhpcyBzZXJpZXMgYWRkcyBhbiBpbmRpdmlkdWFsIHRlc3QgZm9yIFNCSSBTU0UgZXh0ZW5zaW9u
IGFzIHdlbGwgYXMKbmVlZGVkIGluZnJhc3RydWN0dXJlIGZvciBTU0Ugc3VwcG9ydC4gSXQgYWxz
byBhZGRzIHRlc3Qgc3BlY2lmaWMKYXNtLW9mZnNldHMgZ2VuZXJhdGlvbiB0byB1c2UgY3VzdG9t
IE9GRlNFVCBhbmQgREVGSU5FIGZyb20gdGhlIHRlc3QKZGlyZWN0b3J5LgoKLS0tCgpWNzoKIC0g
VGVzdCBpZHMvYXR0cmlidXRlcy9hdHRyaWJ1dGVzIGNvdW50ID4gMzIgYml0cwogLSBSZW5hbWUg
YWxsIFNTRSBmdW5jdGlvbiB0byBzYmlfc3NlXyoKIC0gVXNlIGV2ZW50X2lkIGluc3RlYWQgb2Yg
ZXZlbnQvZXZ0CiAtIEZhY3Rvcml6ZSByZWFkL3dyaXRlIHRlc3QKIC0gVXNlIHZpcnRfdG9fcGh5
cygpIGZvciBhdHRyaWJ1dGVzIHJlYWQvd3JpdGUuCiAtIEV4dGVuc2l2ZWx5IHVzZSBzYmlyZXRf
cmVwb3J0X2Vycm9yKCkKIC0gQ2hhbmdlIGNoZWNrIGZ1bmN0aW9uIHJldHVybiB2YWx1ZXMgdG8g
Ym9vbC4KIC0gQWRkZWQgYXNzZXJ0IGZvciBzdGFjayBzaXplIHRvIGJlIGJlbG93IG9yIGVxdWFs
IHRvIFBBR0VfU0laRQogLSBVc2UgZW4gZW52IHZhcmlhYmxlIGZvciB0aGUgbWF4aW11bSBoYXJ0
IElECiAtIENoZWNrIHRoYXQgaW5kaXZpZHVhbCByZWFkIGZyb20gYXR0cmlidXRlcyBtYXRjaGVz
IHRoZSBtdWx0aXBsZQogICBhdHRyaWJ1dGVzIHJlYWQuCiAtIEFkZGVkIG11bHRpcGxlIGF0dHJp
YnV0ZXMgd3JpdGUgYXQgb25jZQogLSBVc2VkIFJFQURfT05DRS9XUklURV9PTkNFCiAtIEluamVj
dCBhbGwgbG9jYWwgZXZlbnQgYXQgb25jZSByYXRoZXIgdGhhbiBsb29waW5nIGZvcHIgZWFjaCBj
b3JlLgogLSBTcGxpdCB0ZXN0X2FyZyBmb3IgbG9jYWxfZGlzcGF0Y2ggdGVzdCBzbyB0aGF0IGFs
bCBDUFVzIGNhbiBydW4gYXQKICAgb25jZS4KIC0gTW92ZSBTU0UgZW50cnkgYW5kIGdlbmVyaWMg
Y29kZSB0byBsaWIvcmlzY3YgZm9yIG90aGVyIHRlc3RzCiAtIEZpeCB1bm1hc2svbWFzayBzdGF0
ZSBjaGVja2luZwoKVjY6CiAtIEFkZCBtaXNzaW5nICQoZ2VuZXJhdGVkLWZpbGUpIGRlcGVuZGVu
Y2llcyBmb3IgIi1kZXBzIiBvYmplY3RzCiAtIFNwbGl0IFNTRSBlbnRyeSBmcm9tIHNiaS1hc20u
UyB0byBzc2UtYXNtLlMgYW5kIGFsbCBTU0UgY29yZSBmdW5jdGlvbnMKICAgc2luY2UgaXQgd2ls
bCBiZSB1c2VmdWwgZm9yIG90aGVyIHRlc3RzIGFzIHdlbGwgKGRibHRycCkuCgpWNToKIC0gVXBk
YXRlIGV2ZW50IHJhbmdlcyBiYXNlZCBvbiBsYXRlc3Qgc3BlYwogLSBSZW5hbWUgYXNtLW9mZnNl
dC10ZXN0LmMgdG8gc2JpLWFzbS1vZmZzZXQuYwoKVjQ6CiAtIEZpeCB0eXBvIHNiaV9leHRfc3Nf
ZmlkIC0+IHNiaV9leHRfc3NlX2ZpZAogLSBBZGQgcHJvcGVyIGFzbS1vZmZzZXQgZ2VuZXJhdGlv
biBmb3IgdGVzdHMKIC0gTW92ZSBTU0Ugc3BlY2lmaWMgZmlsZSBmcm9tIGxpYi9yaXNjdiB0byBy
aXNjdi8KClYzOgogLSBBZGQgLWRlcHMgdmFyaWFibGUgZm9yIHRlc3Qgc3BlY2lmaWMgZGVwZW5k
ZW5jaWVzCiAtIEZpeCBmb3JtYXR0aW5nIGVycm9ycy90eXBvIGluIHNiaS5oCiAtIEFkZCBtaXNz
aW5nIGRvdWJsZSB0cmFwIGV2ZW50CiAtIEFscGhhYmV0aXplIHNiaS1zc2UuYyBpbmNsdWRlcwog
LSBGaXggYTYgY29udGVudCBhZnRlciB1bm1hc2tpbmcgZXZlbnQKIC0gQWRkIFNTRSBIQVJUX01B
U0svVU5NQVNLIHRlc3QKIC0gVXNlIG12IGluc3RlYWQgb2YgbW92ZQogLSBtb3ZlIHNiaV9jaGVj
a19zc2UoKSBkZWZpbml0aW9uIGluIHNiaS5jCiAtIFJlbW92ZSBzYmlfc3NlIHRlc3QgZnJvbSB1
bml0ZXN0cy5jZmcKClYyOgogLSBSZWJhc2VkIG9uIG9yaWdpbi9tYXN0ZXIgYW5kIGludGVncmF0
ZSBpdCBpbnRvIHNiaS5jIHRlc3RzCgpDbMOpbWVudCBMw6lnZXIgKDYpOgogIGtidWlsZDogQWxs
b3cgbXVsdGlwbGUgYXNtLW9mZnNldHMgZmlsZSB0byBiZSBnZW5lcmF0ZWQKICByaXNjdjogU2V0
IC5hdXgubyBmaWxlcyBhcyAuUFJFQ0lPVVMKICByaXNjdjogVXNlIGFzbS1vZmZzZXRzIHRvIGdl
bmVyYXRlIFNCSV9FWFRfSFNNIHZhbHVlcwogIHJpc2N2OiBsaWI6IEFkZCBTQkkgU1NFIGV4dGVu
c2lvbiBkZWZpbml0aW9ucwogIGxpYjogcmlzY3Y6IEFkZCBTQkkgU1NFIHN1cHBvcnQKICByaXNj
djogc2JpOiBBZGQgU1NFIGV4dGVuc2lvbiB0ZXN0cwoKIHNjcmlwdHMvYXNtLW9mZnNldHMubWFr
IHwgICAyMiArLQogcmlzY3YvTWFrZWZpbGUgICAgICAgICAgfCAgICA2ICstCiBsaWIvcmlzY3Yv
YXNtL2Nzci5oICAgICB8ICAgIDEgKwogbGliL3Jpc2N2L2FzbS9zYmktc3NlLmggfCAgIDQ4ICsr
CiBsaWIvcmlzY3YvYXNtL3NiaS5oICAgICB8ICAxMDYgKysrLQogbGliL3Jpc2N2L3NiaS1zc2Ut
YXNtLlMgfCAgMTAzICsrKysKIGxpYi9yaXNjdi9hc20tb2Zmc2V0cy5jIHwgICAgOSArCiBsaWIv
cmlzY3Yvc2JpLXNzZS5jICAgICB8ICAgODQgKysrKwogcmlzY3Yvc2JpLWFzbS5TICAgICAgICAg
fCAgICA2ICstCiByaXNjdi9zYmktYXNtLW9mZnNldHMuYyB8ICAgMTEgKwogcmlzY3Yvc2JpLXNz
ZS5jICAgICAgICAgfCAxMDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogcmlzY3Yvc2JpLmMgICAgICAgICAgICAgfCAgICAyICsKIHJpc2N2Ly5naXRpZ25vcmUgICAg
ICAgIHwgICAgMSArCiAxMyBmaWxlcyBjaGFuZ2VkLCAxNDQyIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9yaXNjdi9hc20vc2JpLXNzZS5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgbGliL3Jpc2N2L3NiaS1zc2UtYXNtLlMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBsaWIvcmlzY3Yvc2JpLXNzZS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3Yvc2JpLWFz
bS1vZmZzZXRzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktc3NlLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCByaXNjdi8uZ2l0aWdub3JlCgotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
