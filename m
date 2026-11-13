Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F4606A32E
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GL3d2CEw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Uha8B8Kn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oiNxnLQA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=27Ud398AqTMudyCiZPbRZkAqhOV6dK+HbX1OQKIrnC4=; b=GL3d2CEwRXLOWmSWoLSwMo1VxM
	2/9dbyJPmfa3iE+hIuRoQjQk6WnMMrOWCESBr/JBp07GDHca/CGjmbvbVIANP5CZjMrcq3k0UJYA2
	l485GpzhkH7yLfBaz1UxuE7GqZ6Oop/kfdaNCaaoZQX6RYNjOXvSFUhn3Y+B4ujTRUiPFdIsx+9sa
	cUV4Jez6dfxg3ABChFYVdphn7knXDgsl3WMRcZ+JnKwMSNbsVZJUK6jpTcLJ4cJXNLvqAfSA2/V38
	kTDrjFfHL3HIWDBaVEm7CT6h87Xhx/sIRJvgqnlrI7dYuPB5PQYV7uZarYcypU+MEu74+ikyGJsN2
	RPQ4RF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpke-0000000CZjS-1vU7;
	Fri, 13 Nov 2026 11:47:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpkd-0000000CZio-1OJL
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 11:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=; b=Uha8B8KnTCDIKMHQVnsn3IMb+w
	GQn4j77X6uUSAlQswKPSkj8wiEKlsZWz0bm0vj7D/TBdbJGmXDRE/AUqfo/lU3v9f3cxmr/K4A0E1
	fPraU8Dl1kxMqPm7Ta3pHeq4acu+cdhFv9NUjvxOb4niWWViyJkeJNVFyI0XMfd05DoLeBqhjRLff
	n8UVDbmG8FLls48EyWBeQ0FU14ZcFHl2b44+O2CR7tgm0gzf1BcPZ2R04Aa24mJ7r7dYqlPkoInOC
	wDvwZOaHJ+R53nFn0iUgenyNkXlhnZU7/6fTaar5hObwvE4BeIVX4tI6Pv8i09yXTS4zxMmTzmCtV
	N8ua8puw==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpka-0000000BByg-2sLe
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:47:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1178340f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 03:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570442; cv=none;
        d=google.com; s=arc-20260327;
        b=Fy1aK4yI6RfmxD+QUNRvpms8OTVA2gi7yVXviTSzq5KlCm9byPDqWZnFR/FtuqULVw
         On9jADPjEuQVcSaQjmQdDRKhZrZEaJ2GO2mYq2t76eX81Uz9jWnhuWoGvRfG0yddmXGs
         hF+FNOkdRzgjVHo+kbDm2OPaR45UvLQlRwb+tNgGdQutiwY5s1UDvIvdQGwVBnDShIrS
         vSgmFTAQdMnsEbV1mSzPn+pbhslDtz9Rs2zoFwZHpZsk0rD+9EmBbBXyAbWIJuKxqBZW
         G37Meffb+B4ezlYd/BPI4TnPx+cv4Pv3elLZOzCR0p1dK1wvuUHX6gedbBgqrxYA6R0J
         nCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        fh=adRkdIk82pLhy/nLQ2FkYBqsVpHLBkJvY+ri+N7vukw=;
        b=q9CTlVOzoME+x6EdnoRrx/XyLrAiqaEByW7U8QODvEpihbFzHt2hle2ECTvdGwla12
         DPBMNb3zNRXZxr3V/C8y+VHYF1T2nUoN5xrBqo150n45d/NT87COqiJiM1qYWrz8b8OO
         W1O7KM/Hy/30kfed4bd1FY5OxEEEKX6xRBW5DFT6hDNlcuTWkF9p4ccr3FGpSyjO7XIc
         R/BtP7apzGwTDxGdUSpxqzS56hHNYnZ/zZUKBYey1DmRt3IJ/Iy+cqSw/UqNdwaIraNE
         PaxGxdy9VlAfPuzJLiMsZHfELmHv+fzQHA7roH62dgrxeaZeqAFZDM0sjTXgdo6uAxjw
         dahw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794570442; x=1795175242; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        b=oiNxnLQAq8YXwRomW8sthgMMHyrOLgSRp0nKehyGNTiPeRCyEsB5LV8uUxCI612w27
         1rsHrrAYNvpe6VIIgqAzlB0y2WWOSkg5n6ZvRALeY0bhpsdT3FmqZihki4XLeG3HWMA4
         Ly9FPddf5auZh38laIimZs0ellHse+7RvhFMH5t5wYD4cB2aUzRK9mTrdiRZnOjrGg1p
         vvD3Xfr06HcUrMNHOJI2W2Ogac9q0XD6miYjZVlAh+F7zRlXgFOK8k0o24DgrCv3dD+I
         QP8KhSJdgALjLCH8OHQGrIQtYOHYrePqQ8tX9lJe8Nwk96l3U3e3iZvKXlGcf2LGgDPr
         moCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570442; x=1795175242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        b=z5C+oGeDvvcXvCnEwfK5w9akEyPYzU5M03MOOFqwHUxOlXSs95lFXUHgE1xluAXTtf
         FpxiZNhMKk7oflbNhycj5MTjQKOHwosvZlCgoMkNyEa1ZDX4PU5aFC2tWwA9qE8+akmj
         CnxveIrxjGNJZwe31ngUDqOOxxuqwR3NP+KYB36Xa67/ohKjHqm/B/cIugrbRJxdmJ33
         jItawxilZtYg4oHvrVCVFUTHrF5baunQGznOVEIIjJNYRei8FBZyq/MjTqpG6Z7biUKM
         yWPF9FADTU+OxTe/MS5vTIuSP1Q8LNLz3DABCCaB3VO+zBILyoPlICCtDddRwBKCX5pd
         KYfA==
X-Forwarded-Encrypted: i=1; AL+hErHsi4gHEUItvkFne0zKTK0AJ5fdFunaaYDvzXmcYfcZuugjaCVcU4hCzwC4VHg7xSJpoZ0Cx3efu1U=@lists.infradead.org
X-Gm-Message-State: APuU4Z9EW/bPujbeh8kOHu2LskyB0asIaK5HDStHPGec15jFrBtY4Tvi
	K3pR9OaTCFYAWsojyO6LpOMtRGV3X4Qf3JDueTAp9XFrMFVRhuBLG7ve401vEMGnxsdaSnmpP1j
	HnQT504ct5L0c2hY6hukj8fCMyo8q4Uo/nderziWigw==
X-Gm-Gg: AYBFou1xm+o7TpO8ytrl6p7/XjzVHQthdlP+U9VrQz8jJua6oHkhzJJMH1yFMd3mSDj
	ioWtfEb7AqmU0Vqf+/TliNEAlaVRFeqTp2lWMiKTqpeRnZxaEMVcg05Xr6x1aobGEvU0Hlp3Z8C
	pYHD0h58e95P5f3x43GxRfHrdH6s1pPppmYyPWjQssbOQdcOr712DtiImol87+DSzAq6S/1bpwy
	DmpU7HCYtw3AylLiPzmItije5seTy7ce33VzZqiz/q2r+3Nx8ilcgEda+c0ZA1kUkEvRklyZdMS
	Q0btEsrIXRdodzBWDwWU46crQikWrf5MB6ks8SS6/a8Gvm/tG4GRcb/62ocK8kps2VVLE8QTwGc
	N1H6/ZEmOjxzp4eN9x0n0yRanqWUWiIl6SF1Q5YXKTcbZZlP8BPjlSo58raaEHr5lEUZgASawF7
	PBI09FvkLlon5PHz7F8Y6tVIA4ylqwGVTL6L8SzWAVa3fBUlJtF2vB+Ug=
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id
 ffacd0b85a97d-49c70b051bbmr5548639f8f.13.1794570442359; Fri, 13 Nov 2026
 03:47:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027062602.323691-1-qingwei.hu@bytedance.com>
In-Reply-To: <20261027062602.323691-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:17:10 +0530
X-Gm-Features: AclHuK9uFGSNKoGCuQtKwYDOZuyVTnpTYaV59-nL9mz1TmdnUXZYOT-rcssss70
Message-ID: <CAAhSdy0bSJQ8mhWDu+zYW8dWowtcV-mDGHKyp4LSmvnbLWEimw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Validate PMU counter info using available counters
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114724_645655_41C19EA9 
X-CRM114-Status: GOOD (  17.51  )
X-Spam-Score: -0.2 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTE6NTbigK9BTSBRaW5nd2VpIEh1IDxxaW5nd2VpLmh1
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQ09VTlRFUl9HRVRfSU5GTyB2YWxpZGF0ZXMgdGhl
IGNvdW50ZXIgaW5kZXggdXNpbmcgdGhlIHBtY1tdIHN0b3JhZ2UKPiBjYXBhY2l0eSByYXRoZXIg
dGhhbiB0aGUgbnVtYmVyIG9mIGNvdW50ZXJzIGFkdmVydGlzZWQgYnkgTlVNX0NPVU5URVJTLgo+
IFdoZW4gZmV3ZXIgY291bnRlcnMgYXJlIGF2YWlsYWJsZSwgYSBndWVzdCBjYW4gcXVlcnkgYW4g
aW5kZXggb3V0c2lkZQo+IHRoZSBhZHZlcnRpc2VkIHJhbmdlIGFuZCByZWNlaXZlIHN1Y2Nlc3Mu
Cj4KPiBWYWxpZGF0ZSB0aGUgaW5kZXggdXNpbmcga3ZtX3BtdV9udW1fY291bnRlcnMoKSwgbWF0
Y2hpbmcgdGhlIGNvdW50ZXIKPiBpbml0aWFsaXphdGlvbiBhbmQgcmVhZCBwYXRocy4KPgo+IEZp
eGVzOiA4ZjAxNTNlY2QzYmYgKCJSSVNDLVY6IEtWTTogQWRkIHNrZWxldG9uIHN1cHBvcnQgZm9y
IHBlcmYiKQo+IFNpZ25lZC1vZmYtYnk6IFFpbmd3ZWkgSHUgPHFpbmd3ZWkuaHVAYnl0ZWRhbmNl
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGEgZml4IGZvciBMaW51eC03LjQtcmNYCgpUaGFua3Ms
CkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4g
aW5kZXggZTA5NWQxZmY0MzlmLi5lYTc4ODYxOTA5MWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9wbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAt
NTYwLDcgKzU2MCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2luZm8oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBr
dm1fcG11ICprdnBtdSA9IHZjcHVfdG9fcG11KHZjcHUpOwo+Cj4gLSAgICAgICBpZiAoY2lkeCA+
PSBSSVNDVl9LVk1fTUFYX0NPVU5URVJTIHx8IGNpZHggPT0gMSkgewo+ICsgICAgICAgaWYgKGNp
ZHggPj0ga3ZtX3BtdV9udW1fY291bnRlcnMoa3ZwbXUpIHx8IGNpZHggPT0gMSkgewo+ICAgICAg
ICAgICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPiAtLQo+IDIuMzkuNQo+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
