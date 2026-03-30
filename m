Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A11FF494B
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 06:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRALPHoyEL70FBDE/Rg02n41cmY8sd0mnmF5vneta/w=; b=N3ti0Wmy4A8w1X
	FlNHWj0ePNDHbqko6o99uAQmiedtbMZEtgMrLIqcWyT+g6GHYiCf2KVSrd9JpJ+gJyTYF13TDaNe0
	3JEJrKo4/lL159ik9DIYOEb0KIsTE0ZvPHX7pgWxcc1jRoyicVTS2Zcljwp1do4Fo+vMgFW2TgVFI
	4K3S4+czwYv53cT8PtT1Q/LaBo9IK68arJv8mF7QJg+glejAvDBs24ZLdhKgBq7qCNyugBcf0jfVT
	otrzgD8swsKTnMMgIBjryBuA+6YmqigKyzf/NXpLueHnX+HJb4JkXxGStw1O1KksiVUkR8ijVceRk
	4WUZfcUVuRHeWWBnjIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764m-0000000AgSc-2ziP;
	Mon, 30 Mar 2026 06:26:16 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764i-0000000AgPX-0942
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 06:26:13 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-4043b909ed4so2521914fac.3
        for <kvm-riscv@lists.infradead.org>; Sun, 29 Mar 2026 23:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774851970; cv=none;
        d=google.com; s=arc-20240605;
        b=DNGnGbLtFXVexIRVxL78PNLaI3DQ7TMA9RPRMRpLol6HNofkaG4zHlG7hB+e5OYnPb
         3XfOacwmvhyiQ/ZXMy6QehPwjedVR5orIibIsWoC3k0r3A5uHA6wQJt3omoGog7GKrL0
         +15flFLoc0ikYBuJdhcbMCbdrmGAKc3leDyqpvwOnPI/SXDVMPtmuthtmN/TJXhKJfGu
         45Oi5mf8qyMr/oWlSAFjiNei6Go0e1OSoRgm/saZrhlqLjD9PGYFs6zIQITb40YzAkQK
         udscS5PSlwFz3xHpBYzso3biutdjvFEsXZ8UmNnBVznQnlQGaUIqIboZ2N3Jipy7vkXG
         kONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrwvlaBx0LSVffRWiq7EdPDPOPDDTLgFInSvGTF5+7k=;
        fh=TlLqoM2/wU8aUouIDT1HW9E1W9qcKcaE+vz4KePPBYA=;
        b=NSCdcLWyrgXlAGkViKTvx2D3B87q+3PUEIejxRH6lqB0FD6imUfvkm9+X3M/q0hqVW
         McUk0q0ruMJsVsdSRuRVI7JH3DKJ3w61TwF1y0/ovsvfgmu3oMWT1NFfLnkP5MJuo6/T
         XPlOQ5UtUewUi2ZhlxdaY6GVCxiu7JvxdQouA3A2ZTkj0/b3UdaK587SKxeZftBkTa1I
         0WaZd+evVTDOe0V4APIilAeptIP4NPnKMZBPX5gkhDRG92cWxQGtnMdqZqUTVx+uYI9M
         rrT0BFwL8X9HOaitU5L6kcf8I/n2er8Ug5XxaxDddMuaB0jtqrFjzSSNbnqIKXtJ5/BK
         5wXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774851970; x=1775456770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrwvlaBx0LSVffRWiq7EdPDPOPDDTLgFInSvGTF5+7k=;
        b=o5+xJ4dJzSwzTpy0ktMPnJFMGRe2gHXYAR3iC7m5dsZZoxTNaOJMvOMAMde7qyWnYI
         +4Yn5diVMgXrrosONJ2+651ygn/6BR+WASZJriLwoq30YcE7CpfHtK26NXt46PSqOtXz
         G7x07ZWKV8kkD13c2RG85GoeUL/GZFcNOfWF94y6IUeaIOm3r6h/XwyIlrYr4i+OJ+Z0
         tqrA7OCn78y/ihNR8dyyE+I81vmjKV6MywBaurNfPnRIjx1yGHkFMG8/se2oZXbV6FQQ
         jWRDOEAG7QbPhp6S71xdVVgcwp5wYin1CLrss7qCoqINJaZlk/n8zrwpTAVUQE6l0ip+
         zNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851970; x=1775456770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrwvlaBx0LSVffRWiq7EdPDPOPDDTLgFInSvGTF5+7k=;
        b=VfsIwx5N4ciAOiC14DLfAdTi2E3XUXUh26Z+dB4psD8mfrk7MVSrVr8W+7nQdcxYmH
         k/7Xx1Bu3iPEohWJB9wWiEIBSvP2dP9/eIdVx69Sv3dTeC0AnEzpyOYFRzaPY33Ml9s7
         ZPl6hvrZGMDQh2dcaEYed0NrAtfSyBzd7GST0ALZE1FXlmCorK4EdnkhgL3Q9nuQTcT+
         3UMhUN58RhKJMzpiR8Hhe/WjwPLoxuiMF5LEZtPRHo5T6ccPM6A4Y9X5dv/JGjJByRtR
         ADZHhH02qbULIrNYawMzxsjNAeGL/TqZ/xhhr6VVrDllDgHYuKjuIxKhE2N7U3JZZBQZ
         9ToA==
X-Forwarded-Encrypted: i=1; AJvYcCUYhGp0ls0EHXoZ/BgK/KySSSWzSGrcA04GnTqjv7fmaSZOEU+2Yel+o+JgyneAqxAgdadoq0FRlnE=@lists.infradead.org
X-Gm-Message-State: AOJu0YykfjZuW+U6UpHplUB0qYZM62mujb2/rr3ZohVFvrNxSvX1uJMs
	vuVhfO5K+ocjqXIIULJiq22REUlGK6v5+V/UbwQ1xjrbpiBaVFs49U7JzoDnfRBYR6x1tCcyt3M
	BoPTUH+amrRQWf3fd0J0mXiDL0qDVAnOYGZc/hFpE7w==
X-Gm-Gg: ATEYQzzwQN6oVpLEAKOF/bcYA5h2Cj6USTdgzH4idI3nmEN5pnnJWRniT1WWdjMdxHa
	zXcCc4zstFpMQDOYsFVySG2Wf05BDGsbsT9YMDgy1nwxssBktt1TfBhvh+Nd1tT+BILrH91aVQa
	JjJGcsxJ4MZr7Bu7Hom3tROVtOJWCQaTBlyFvD/zT4wN2qTn9e97KebaGY+pSmY7IiG+6d6Pvr9
	7ZiAUqlm0USsRwOMHWPgeHRfbeqiC0YcgpJeKdpV2QUNdnt2Q/IyrEWS81Cy5NeBmgQ4RpxvcGQ
	BulY64OBnAox3lqaRDRsRUi4NQLQCLYz7zNVPRNldG/dce6DefNspvTvMorB/tYfrrGjArXg7Ww
	+yKPkfQHWCT8wCAisTsP6Sm8tOw==
X-Received: by 2002:a4a:edcb:0:b0:67b:c368:1369 with SMTP id
 006d021491bc7-67e18789a18mr6118049eaf.67.1774851970320; Sun, 29 Mar 2026
 23:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn> <20260316142017362R7MOT-xQWGMPiGnD0zuht@zte.com.cn>
In-Reply-To: <20260316142017362R7MOT-xQWGMPiGnD0zuht@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 11:55:59 +0530
X-Gm-Features: AQROBzBSVCFROHxb8xNa1XL2q6xBhknLcFRs-3GhKLKb_1oKXuQ7G-6tU_lxD0U
Message-ID: <CAAhSdy0Yc_iViKv7r69=m+XrpHxpvWKQNgqBYDKM+dQtNB_8ng@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RISC-V: KVM: Split huge pages during fault
 handling for dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_232612_091128_023A59E3 
X-CRM114-Status: GOOD (  27.27  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6NTDigK9BTSA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4gd3JvdGU6Cj4KPiBGcm9tOiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPgo+IER1cmluZyBkaXJ0eSBsb2dnaW5nLCBhbGwgaHVnZSBwYWdlcyBhcmUgd3JpdGUt
cHJvdGVjdGVkLiBXaGVuIHRoZSBndWVzdAo+IHdyaXRlcyB0byBhIHdyaXRlLXByb3RlY3RlZCBo
dWdlIHBhZ2UsIGEgcGFnZSBmYXVsdCBpcyB0cmlnZ2VyZWQuIEJlZm9yZQo+IHJlY292ZXJpbmcg
dGhlIHdyaXRlIHBlcm1pc3Npb24sIHRoZSBodWdlIHBhZ2UgbXVzdCBiZSBzcGxpdCBpbnRvIHNt
YWxsZXIKPiBwYWdlcyAoZS5nLiwgNEspLiBBZnRlciBzcGxpdHRpbmcsIHRoZSBub3JtYWwgbWFw
cGluZyBwcm9jZXNzIHByb2NlZWRzLAo+IGFsbG93aW5nIHdyaXRlIHBlcm1pc3Npb24gdG8gYmUg
cmVzdG9yZWQgYXQgdGhlIHNtYWxsZXIgcGFnZSBncmFudWxhcml0eS4KPgo+IElmIGRpcnR5IGxv
Z2dpbmcgaXMgZGlzYWJsZWQgYmVjYXVzZSBtaWdyYXRpb24gZmFpbGVkIG9yIHdhcyBjYW5jZWxs
ZWQsCj4gb25seSByZWNvdmVyIHRoZSB3cml0ZSBwZXJtaXNzaW9uIGF0IHRoZSA0SyBsZXZlbCwg
YW5kIHNraXAgcmVjb3ZlcmluZyB0aGUKPiBodWdlIHBhZ2UgbWFwcGluZyBhdCB0aGlzIHRpbWUg
dG8gYXZvaWQgdGhlIG92ZXJoZWFkIG9mIGZyZWVpbmcgcGFnZSB0YWJsZXMuCj4gVGhlIGh1Z2Ug
cGFnZSBtYXBwaW5nIGNhbiBiZSByZWNvdmVyZWQgaW4gdGhlIGlvY3RsIGNvbnRleHQsIHNpbWls
YXIgdG8geDg2LAo+IGluIGEgbGF0ZXIgcGF0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFll
Y2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0v
Z3N0YWdlLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiBpbmRleCA1MzU2
YWJiMTg5MzIuLjRiZWUwNDJmM2M3ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9nc3Rh
Z2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gQEAgLTE2Myw2ICsxNjMsMjEg
QEAgaW50IGt2bV9yaXNjdl9nc3RhZ2Vfc2V0X3B0ZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdl
LAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IGt2bV9yaXNjdl9nc3Rh
Z2VfdXBkYXRlX3B0ZV9wcm90KHB0ZV90ICpwdGVwLCBwZ3Byb3RfdCBwcm90KQo+ICt7Cj4gKyAg
ICAgICBwdGVfdCBuZXdfcHRlOwo+ICsKPiArICAgICAgIGlmIChwZ3Byb3RfdmFsKHB0ZV9wZ3By
b3QocHRlcF9nZXQocHRlcCkpKSA9PSBwZ3Byb3RfdmFsKHByb3QpKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBuZXdfcHRlID0gcGZuX3B0ZShwdGVfcGZuKHB0ZXBf
Z2V0KHB0ZXApKSwgcHJvdCk7Cj4gKyAgICAgICBuZXdfcHRlID0gcHRlX21rZGlydHkobmV3X3B0
ZSk7Cj4gKwo+ICsgICAgICAgc2V0X3B0ZShwdGVwLCBuZXdfcHRlKTsKPiArCj4gKyAgICAgICBy
ZXR1cm4gMTsKPiArfQo+ICsKPiAgaW50IGt2bV9yaXNjdl9nc3RhZ2VfbWFwX3BhZ2Uoc3RydWN0
IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3Qga3ZtX21tdV9tZW1vcnlfY2FjaGUgKnBjYWNoZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBncGFfdCBncGEsIHBoeXNfYWRkcl90IGhwYSwgdW5zaWduZWQgbG9uZyBwYWdlX3Np
emUsCj4gQEAgLTE3MSw2ICsxODYsOSBAQCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9tYXBfcGFnZShz
dHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLAo+ICB7Cj4gICAgICAgICBwZ3Byb3RfdCBwcm90Owo+
ICAgICAgICAgaW50IHJldDsKPiArICAgICAgIHB0ZV90ICpwdGVwOwo+ICsgICAgICAgdTMyIHB0
ZXBfbGV2ZWw7Cj4gKyAgICAgICBib29sIGZvdW5kX2xlYWY7Cj4KPiAgICAgICAgIG91dF9tYXAt
PmFkZHIgPSBncGE7Cj4gICAgICAgICBvdXRfbWFwLT5sZXZlbCA9IDA7Cj4gQEAgLTIwMyw2ICsy
MjEsNDQgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2VfbWFwX3BhZ2Uoc3RydWN0IGt2bV9nc3RhZ2Ug
KmdzdGFnZSwKPiAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHByb3QgPSBQQUdFX1dSSVRFOwo+ICAgICAgICAgfQo+ICsKPiArICAgICAgIGZvdW5kX2xlYWYg
PSBrdm1fcmlzY3ZfZ3N0YWdlX2dldF9sZWFmKGdzdGFnZSwgZ3BhLCAmcHRlcCwgJnB0ZXBfbGV2
ZWwpOwo+ICsgICAgICAgaWYgKGZvdW5kX2xlYWYpIHsKPiArICAgICAgICAgICAgICAgLyoKPiAr
ICAgICAgICAgICAgICAgICogcHRlcF9sZXZlbCBpcyB0aGUgY3VycmVudCBnc3RhZ2UgbWFwcGlu
ZyBsZXZlbCBvZiBhZGRyLCBvdXRfbWFwLT5sZXZlbAo+ICsgICAgICAgICAgICAgICAgKiBpcyB0
aGUgcmVxdWlyZWQgbWFwcGluZyBsZXZlbCBkdXJpbmcgZmF1bHQgaGFuZGxpbmcuCj4gKyAgICAg
ICAgICAgICAgICAqCj4gKyAgICAgICAgICAgICAgICAqIDEpIHB0ZXBfbGV2ZWwgPiBvdXRfbWFw
LT5sZXZlbAo+ICsgICAgICAgICAgICAgICAgKiBUaGlzIGhhcHBlbnMgd2hlbiBkaXJ0eSBsb2dn
aW5nIGlzIGVuYWJsZWQgYW5kIGh1Z2UgcGFnZXMgYXJlIHVzZWQuCj4gKyAgICAgICAgICAgICAg
ICAqIEtWTSBtdXN0IHRyYWNrIHRoZSBwYWdlcyBhdCA0SyBsZXZlbCwgYW5kIHNwbGl0IHRoZSBo
dWdlIG1hcHBpbmcKPiArICAgICAgICAgICAgICAgICogaW50byA0SyBtYXBwaW5ncy4KPiArICAg
ICAgICAgICAgICAgICoKPiArICAgICAgICAgICAgICAgICogMikgcHRlcF9sZXZlbCA8IG91dF9t
YXAtPmxldmVsCj4gKyAgICAgICAgICAgICAgICAqIFRoaXMgaGFwcGVucyB3aGVuIGRpcnR5IGxv
Z2dpbmcgaXMgZGlzYWJsZWQgYW5kIGh1Z2UgcGFnZXMgYXJlIHVzZWQuCj4gKyAgICAgICAgICAg
ICAgICAqIFRoZSBnc3RhZ2UgaXMgc3BsaXQgaW50byA0SyBtYXBwaW5ncywgYnV0IHRoZSBvdXRf
bWFwIGxldmVsIGlzIG5vdwo+ICsgICAgICAgICAgICAgICAgKiBiYWNrIHRvIHRoZSBodWdlIHBh
Z2UgbGV2ZWwuIElnbm9yZSB0aGUgb3V0X21hcCBsZXZlbCB0aGlzIHRpbWUsIGFuZAo+ICsgICAg
ICAgICAgICAgICAgKiBqdXN0IHVwZGF0ZSB0aGUgcHRlIHByb3QgaGVyZS4gT3RoZXJ3aXNlLCB3
ZSB3b3VsZCBmYWxsIGJhY2sgdG8gbWFwcGluZwo+ICsgICAgICAgICAgICAgICAgKiB0aGUgZ3N0
YWdlIGF0IGh1Z2UgcGFnZSBsZXZlbCBpbiBga3ZtX3Jpc2N2X2dzdGFnZV9zZXRfcHRlYCwgd2l0
aCB0aGUKPiArICAgICAgICAgICAgICAgICogb3ZlcmhlYWQgb2YgZnJlZWluZyB0aGUgcGFnZSB0
YWJsZXMobm90IHN1cHBvcnQgbm93KSwgd2hpY2ggd291bGQgc2xvdwo+ICsgICAgICAgICAgICAg
ICAgKiBkb3duIHRoZSB2Q1BVcycgcGVyZm9ybWFuY2UuCj4gKyAgICAgICAgICAgICAgICAqCj4g
KyAgICAgICAgICAgICAgICAqIEl0IGlzIGJldHRlciB0byByZWNvdmVyIHRoZSBodWdlIHBhZ2Ug
bWFwcGluZyBpbiB0aGUgaW9jdGwgY29udGV4dCB3aGVuCj4gKyAgICAgICAgICAgICAgICAqIGRp
c2FibGluZyBkaXJ0eSBsb2dnaW5nLgo+ICsgICAgICAgICAgICAgICAgKgo+ICsgICAgICAgICAg
ICAgICAgKiAzKSBwdGVwX2xldmVsID09IG91dF9tYXAtPmxldmVsCj4gKyAgICAgICAgICAgICAg
ICAqIFdlIGFscmVhZHkgaGF2ZSB0aGUgcHRlcCwganVzdCB1cGRhdGUgdGhlIHB0ZSBwcm90IGlm
IHRoZSBwZm4gbm90IGNoYW5nZS4KPiArICAgICAgICAgICAgICAgICogVGhlcmUgaXMgbm8gbmVl
ZCB0byBpbnZva2UgYGt2bV9yaXNjdl9nc3RhZ2Vfc2V0X3B0ZWAgYWdhaW4uCj4gKyAgICAgICAg
ICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBpZiAocHRlcF9sZXZlbCA+IG91dF9tYXAtPmxl
dmVsKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9zcGxpdF9o
dWdlKGdzdGFnZSwgcGNhY2hlLCBncGEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG91dF9tYXAtPmxldmVsLCB0cnVlKTsKPiArICAgICAgICAg
ICAgICAgfSBlbHNlIGlmIChBTElHTl9ET1dOKFBGTl9QSFlTKHB0ZV9wZm4ocHRlcF9nZXQocHRl
cCkpKSwgcGFnZV9zaXplKSA9PSBocGEpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
a3ZtX3Jpc2N2X2dzdGFnZV91cGRhdGVfcHRlX3Byb3QocHRlcCwgcHJvdCkpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnc3RhZ2VfdGxiX2ZsdXNoKGdzdGFnZSwgcHRlcF9sZXZl
bCwgb3V0X21hcC0+YWRkcik7CgpXaHkgbm90IGNhbGwgZ3N0YWdlX3RsYl9mbHVzaCgpIGZyb20g
a3ZtX3Jpc2N2X2dzdGFnZV91cGRhdGVfcHRlX3Byb3QoKSBhbmQKcmV0dXJuIHZvaWQgZnJvbSBr
dm1fcmlzY3ZfZ3N0YWdlX3VwZGF0ZV9wdGVfcHJvdCgpID8KCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gICAg
ICAgICBvdXRfbWFwLT5wdGUgPSBwZm5fcHRlKFBGTl9ET1dOKGhwYSksIHByb3QpOwo+ICAgICAg
ICAgb3V0X21hcC0+cHRlID0gcHRlX21rZGlydHkob3V0X21hcC0+cHRlKTsKPgo+IC0tCj4gMi4y
Ny4wCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
