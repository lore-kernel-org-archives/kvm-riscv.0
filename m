Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491FC0219B
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ndw+eF0zlVbyDfCM9jozElXbpfmLQoee2lATa0i3rCQ=; b=mMErs/+w1Se73L
	JvpvXISIVadVAqW63veCR41oo87f6YEQqzLJraDD89WKdtYUceswr6csr6PPhjOIH86JlNN77r3bO
	PBZWKrV/Uv1/IZPpL/UbutRrsF9SVs3FbBZ2PsqWqiYZ+HsN5juLJpQm0WdQFZmrye+nrg5WsXYz7
	2qofjo3J/BbcuMp85Vxeawj7p4mUmiehj7yzAR/3zJwjxudFuN3d5VRH15IMl6ZLhMQd9SyoWVvkN
	qUvdPphj4NuyGWmAmyPEZs9JOckMj42mIpsqOIFUGHw7iKyRx4wdrEZ0PFMMoDP/30phKZrs3l2s/
	i2IrAsdAz/UQbl0zCTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thphy-00000003pkP-3sKx;
	Tue, 11 Feb 2025 12:49:46 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoup-00000003faE-00f4
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 11:59:00 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-308f32984bdso14782851fa.1
        for <kvm-riscv@lists.infradead.org>; Tue, 11 Feb 2025 03:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739275136; x=1739879936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfrJOs3nOC/uZQWBsu2L0oE9KdKFjO9EW7o+/+NgYt8=;
        b=Qrfzq069VoCRDp7/rmx3ox4qy2GKeJkKBf85gtXVhZQwrXMD5Or2MJ2tFkawIeKCM7
         HaZL8+BLSNioCewhd1+JBQdoCGuWRmLjF6ft6MIqzddPhJyl/50P48zf9kzt81dIkcCX
         LVYSdHoDXKJUQQbY2NTxRNDTmV8UdWEDTvyMEOmaS6iTqJowEbwOeg8aKd3hpLXvckvb
         FU0mTQ7kirMPeGVViN6BJsLd9RD1SaW5HS2PUhRLZonUzyyaU91VMOaQ2skN86fRSnxZ
         hVpxif5wsnZ8l0sxGCUUxts0SW9Q7aj+rJxllE3a2z3VfBAgTV2aoWvjUIyrf+H0lZDp
         h0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275136; x=1739879936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfrJOs3nOC/uZQWBsu2L0oE9KdKFjO9EW7o+/+NgYt8=;
        b=pM/BmM1+e0s0L5docI5/Yff3jj9VDplMJTfLq+xhHrACcbq7NPtX1Pb6uviAxlAdd6
         rACANaoQZE6oPUVTznApccxPRMzI9xeUzdPcFQRV4em9m7eAuSpQS6/fPLkLJ2qHPv/A
         ZHWPzB9nbXxaLkv1tjfmr2eokFX2w0IpktgLosBf1ei50e5/qvcCCIEXJ6Pb434fCdpj
         NPzPk5V6sny50u46Ed0RI326fVKnGIPuUFsfNLWTcuPH2Vl8gd4Sg+YGzrjSOhV74TIA
         Y7iTDGSmQsUVQRf8j8YqdR5d3BkkJHkgaYY1xXb6eJX58F1Gbnt/FxPXGZWFCsGWBdhU
         J11Q==
X-Forwarded-Encrypted: i=1; AJvYcCWU7KBrJKd/jKi64CfL1UVN2LweU00bli6u10zZVZFE+zPY9/PRc4f8vR71FAJomRG4b9ZiTk2fwsM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt/7IYZzvZScQF1jaDQwG1b0nJrFD746n/KYdfRCyrEOz/Ol8r
	ZXVtKd2JZBOeEA008g1aFl4Ef9Ean69aCgr6qNTU4VqKM07D51WozhNmYw1NK7D17iPEavXbPgW
	KxdDLstXv6WRzvybX5fPiSI2wP0DAONGQKcYQKA==
X-Gm-Gg: ASbGncs4xxs+7I5RKynSUam/WvmpWaUHhtCH6irDQIsVAL0wKK9rGqIEbcuVvGIP1cT
	clnZ4hoD+SUG0yh0Z6rpu05F+Tma/L+KXlNWJWFmxv2v9JocHEvjb9HK+LNy1MGVNr5ZvNYF7HA
	==
X-Google-Smtp-Source: AGHT+IHi9fRc7g4LXLMTTrfhBpjvIDawNVLbxz/VrpF9Ym/YVJUnNi9Ybh2IY4Q2sYmZ++mmturgtiMZM7nnBID564I=
X-Received: by 2002:a05:6512:2316:b0:543:9a61:a2e5 with SMTP id
 2adb3069b0e04-54414aa87c8mr5949576e87.23.1739275136403; Tue, 11 Feb 2025
 03:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20250127132424.339957-1-apatel@ventanamicro.com>
 <20250127132424.339957-3-apatel@ventanamicro.com> <20250211114018.GB8965@willie-the-truck>
In-Reply-To: <20250211114018.GB8965@willie-the-truck>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 11 Feb 2025 17:28:43 +0530
X-Gm-Features: AWEUYZkAL12uMf-9Tj-TWkSprxk8wj7zzxxQgrdbCiYSyAP6uq0zWoQGQGyineM
Message-ID: <CAK9=C2VPs=VLPWupSjzz_y4QRtL56eQC3DCJVEjrREy-qmbHVQ@mail.gmail.com>
Subject: Re: [kvmtool PATCH 2/6] Add __KERNEL_DIV_ROUND_UP() macro
To: Will Deacon <will@kernel.org>
Cc: julien.thierry.kdev@gmail.com, maz@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_035859_045129_AEDEC5E6 
X-CRM114-Status: GOOD (  15.54  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgNToxMOKAr1BNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMDY6NTQ6MjBQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoZSBsYXRlc3QgdmlydGlvX3BjaS5oIGhlYWRlciBm
cm9tIExpbnV4LTYuMTMga2VybmVsIHJlcXVpcmVzCj4gPiBfX0tFUk5FTF9ESVZfUk9VTkRfVVAo
KSBtYWNybyBzbyBkZWZpbmUgaXQgY29uZGl0aW9uYWxseSBpbgo+ID4gbGludXgva2VybmVsLmgu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L2tlcm5lbC5oIHwgMyArKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgva2VybmVsLmggYi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oCj4gPiBpbmRleCA2YzIyZjFj
Li5kZjQyZDYzIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9rZXJuZWwuaAo+ID4gKysr
IGIvaW5jbHVkZS9saW51eC9rZXJuZWwuaAo+ID4gQEAgLTgsNiArOCw5IEBACj4gPiAgI2RlZmlu
ZSByb3VuZF9kb3duKHgsIHkpICAgICAoKHgpICYgfl9fcm91bmRfbWFzayh4LCB5KSkKPiA+Cj4g
PiAgI2RlZmluZSBESVZfUk9VTkRfVVAobixkKSAoKChuKSArIChkKSAtIDEpIC8gKGQpKQo+ID4g
KyNpZm5kZWYgX19LRVJORUxfRElWX1JPVU5EX1VQCj4gPiArI2RlZmluZSBfX0tFUk5FTF9ESVZf
Uk9VTkRfVVAobixkKSAgIERJVl9ST1VORF9VUChuLGQpCj4gPiArI2VuZGlmCj4KPiBJJ20gaGFw
cHkgdG8gdGFrZSB0aGlzIGZvciBub3csIGJ1dCBwZXJoYXBzIHdlIHNob3VsZCBiZSBwdWxsaW5n
Cj4gaW4gdGhlIHVhcGkgY29uc3QuaCBoZWFkZXIgaW5zdGVhZCBvZiByb2xsaW5nIHRoaXMgb3Vy
c2VsdmVzPyBJZGVhbGx5LAo+IGtlcm5lbC5oIHdvdWxkIGRpc2FwcGVhciBhbHRvZ2V0aGVyLgo+
CgpTdXJlLCBuZXh0IHRpbWUgSSB3aWxsIHRyeSB0byBwdWxsIHRoZSB1YXBpIGNvbnN0LmggaGVh
ZGVyIGludG8ga3ZtdG9vbC4KClRoYW5rcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
