Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEDFCCA470
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+n/5XF50eOQ3kGquZOIEdyDDqX/fGKaAltnvSqhbpYw=; b=oPX6TRNt4IBG93
	Kt0ZgDm5+PFkuVUsQBWnS7woG/CCAHhe3AQDTfAZvdIJczJ9lWFcLx7gCcIeve3idSjbpGD1tyRQM
	4MEVa/Ef4RF89/cAU79OTMfn/cpgaaTuW4mbVJSax0tbkjBOuDdA62IyS+Ptj3fZdUM+4QzmFO3Jj
	tT9PGs4QmPewxs4V7KIb6u5m85/+EQXhvpmNsoOkh3WGGWAo05mFQi1xrXfboY3+vD+mX9u2MKu/t
	9+OYfYXEICbFeH3wKOgXg3e1wuSabjVNuSkz3CL54W/oOMqkPSh7CjgxvP8Xd5/R0akCDq5sRq/mX
	HdONzgjhvX8jamb38UyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40gs-00000008eTu-1Xs4;
	Wed, 01 Oct 2025 17:32:34 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40gq-00000008eTR-12q6
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 17:32:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27eeafd4882so15525ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Oct 2025 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759339951; x=1759944751; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o/YWYDtjG6ffJt7pjNnPORxoGZIxj6mJz/9fII2K1Ck=;
        b=JSNVnl0rffW8XLStCLxNi4zUMWO9xaF6ZEYd9SwKCrhPQBjJowQezBkrrsC6kyWI0L
         eCaYY4gdaU+KydLbmwnetR7+KOEgZf17qu9QPCDyaUQkbY8CSBOFpA3vYShBGzrjgcDZ
         0etSy3H/xVxc1fCmAYydFDpnjkgS6lyiRWiF7AHQV2A0vVTmp1cDHaH7e52+Ah95In60
         hnQtzxczXPz1nr5VXIs02TNG4HgaQ3WFkPRvxdfLvb8p8fxr+uoWKdNreLqGiDKhp/VK
         RaPHXowJ912nWYHuodCQdCgZzlYzWQfDlEAJyf1dMz+PVnYonUH06mEEV9mBg/8CiDYr
         kwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759339951; x=1759944751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/YWYDtjG6ffJt7pjNnPORxoGZIxj6mJz/9fII2K1Ck=;
        b=WMUgnWtuFNc88YRmE1ma65HoZLyBCz5o+0zQE9aNSeT7uSI/PMUgUVm/MQHZKXNbgx
         XChkKRhjEjyP5LvwVqfLxH6qQQ4PgC4UUzPM/eJPdmHZzQr7otuWWJ/n9LOGOocMf6hw
         U04Lm5V4JEOXxDXAI+XD2wUvLw/jNuyC8/K3Lj1sCiZsgjZ78+BuXuzwJJqdb7DJVQio
         TExJBWMFnhACbMKFea7r16sjH2xBn0iNmedfmH6pMkVkOT8oaLhoN8b/nFng2VbDssTj
         II3ZV0VIjofghvYYF2rCcoy450wyKygzAX6gr+nMsbq9IyUscbrxBHWTHTY7mnJL6C1S
         n4FA==
X-Forwarded-Encrypted: i=1; AJvYcCX4sshQhnH0GR/BaX7kWZeXhLgbrL4jnraKQbXKXgXn8AznO9zHY9rUi8uZs8YJdR12ZKmVEyniwJE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpsG99i1+g7FEHR8dnyEHXfeKB7CfqQrelDXN2plS1xJnC9xc6
	7oET7+nmqFVilb8X8opq6500KejqSH36X1UkCykKVxCbePtu0+YmUEPPjIl5Dwo11w==
X-Gm-Gg: ASbGncs7j3bGIjHnbnIMRAKAuFAxfabNkuYihfQqOEA65Dfl5TX9TKj1qxWgIUWy+vG
	uMla6nf9SYNf4TS93D3f1Ukl01I9cBPIpLu79j0cvb/coEX0YYYyaLBFMB4Arylge0+etkx8khr
	CyTJ8CLpN4lTvXVhPTa7AnECfQLAUn/eWx6Fq0j+Tw5YjoMqxAyDWMkHmpFtnJQASRkNbMlCJ8l
	mnGZ/2nf3KpTiPJFMresPRFRLJn6apHIJyWXcGmtpxoKgUVNBpENkWUDtv3u4VOwytfKcx/3u0w
	dgdcbIRQDsFDDTX3C6k5oNxx32d4relZUlN9QtCKHDpI1gHJstcGF3kN+oADB1tJ/b/l0Xxr5Jy
	cJJ7b3dsuJEU6S3e933G2PqKlaYVI+DL8OHqcuG9z05Btmp/McNSImMbIY1xqNSnJvJLXvrhbVq
	54jlLta4JRbijTmxl/cw==
X-Google-Smtp-Source: AGHT+IHx7ebKepLK2+ba7wopXv1hEpDMMQTNfdMH8JIKjgqqvoILE8tuG/fflLyAGOySPePvLbMnkQ==
X-Received: by 2002:a17:903:22c2:b0:26d:a02f:b046 with SMTP id d9443c01a7336-28e8dd04808mr80535ad.11.1759339950898;
        Wed, 01 Oct 2025 10:32:30 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm2827615a91.18.2025.10.01.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 10:32:30 -0700 (PDT)
Date: Wed, 1 Oct 2025 10:32:25 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, seanjc@google.com,
	pbonzini@redhat.com, borntraeger@linux.ibm.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org,
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn,
	chenhuacai@kernel.org, oliver.upton@linux.dev,
	ajones@ventanamicro.com
Subject: Re: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
Message-ID: <20251001173225.GA420255.vipinsh@google.com>
References: <20250930163635.4035866-1-vipinsh@google.com>
 <20250930163635.4035866-10-vipinsh@google.com>
 <86qzvnypsp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86qzvnypsp.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_103232_295411_805ABF18 
X-CRM114-Status: GOOD (  22.43  )
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

T24gMjAyNS0xMC0wMSAwOTo0NDoyMiwgTWFyYyBaeW5naWVyIHdyb3RlOgo+IE9uIFR1ZSwgMzAg
U2VwIDIwMjUgMTc6MzY6MzUgKzAxMDAsCj4gVmlwaW4gU2hhcm1hIDx2aXBpbnNoQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4gCj4gPiArS1ZNIHNlbGZ0ZXN0IHJ1bm5lciBpcyBoaWdobHkgY29uZmln
dXJhYmxlIHRlc3QgZXhlY3V0b3IgdGhhdCBhbGxvd3MgdG8gcnVuCj4gPiArdGVzdHMgd2l0aCBk
aWZmZXJlbnQgY29uZmlndXJhdGlvbnMgKG5vdCBqdXN0IHRoZSBkZWZhdWx0KSwgcGFyYWxsZWx5
LCBzYXZlCj4gCj4gcy9wYXJhbGxlbHkvaW4gcGFyYWxsZWwvCj4gCgpUaGFua3MsIEkgd2lsbCBm
aXggaXQuCgo+ID4gK291dHB1dCB0byBkaXNrIGhpZXJhcmNoaWNhbGx5LCBjb250cm9sIHdoYXQg
Z2V0cyBwcmludGVkIG9uIGNvbnNvbGUsIHByb3ZpZGUKPiA+ICtleGVjdXRpb24gc3RhdHVzLgo+
ID4gKwo+ID4gK1RvIGdlbmVyYXRlIGRlZmF1bHQgdGVzdHMgdXNlOjoKPiA+ICsKPiA+ICsgICMg
bWFrZSB0ZXN0c19pbnN0YWxsCj4gPiArCj4gPiArVGhpcyB3aWxsIGNyZWF0ZSBgYHRlc3RjYXNl
c19kZWZhdWx0X2dlbmBgIGRpcmVjdG9yeSB3aGljaCB3aWxsIGhhdmUgdGVzdGNhc2VzCj4gCj4g
SSBkb24ndCB0aGluayB1c2luZyB0aGUgZnV0dXJlIHRlbnNlIGlzIGNvcnJlY3QgaGVyZS4gSSdk
IHJhdGhlciBzZWUKPiBzb21ldGhpbmcgd3JpdHRlbiBpbiB0aGUgcHJlc2VudCB0ZW5zZSwgcG9z
c2libHkgaW1wZXJhdGl2ZS4gRm9yCj4gZXhhbXBsZToKPiAKPiAiQ3JlYXRlICdibGFoJyBkaXJl
Y3RvcnkgY29udGFpbmluZyAnZm9vJyBmaWxlcywgb25lIHBlciB0ZXN0LWNhc2UuCj4gCgpUaGFu
a3MsIEkgd2lsbCBmaXggaXQuCgo+ID4gK2luIGBkZWZhdWx0LnRlc3RgIGZpbGVzLiBFYWNoIEtW
TSBzZWxmdGVzdCB3aWxsIGhhdmUgYSBkaXJlY3RvcnkgaW4gIHdoaWNoCj4gPiArYGRlZmF1bHQu
dGVzdGAgZmlsZSB3aWxsIGJlIGNyZWF0ZWQgd2l0aCBleGVjdXRhYmxlIHBhdGggcmVsYXRpdmUg
dG8gS1ZNCj4gPiArc2VsZnRlc3Qgcm9vdCBkaXJlY3RvcnkgaS5lLiBgL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bWAuCj4gCj4gU2hvdWxkbid0IHRoaXMgaG9ub3IgdGhlIGV4aXN0aW5nIGJ1
aWxkIG91dHB1dCBkaXJlY3RpdmVzPyBJZiBpdAo+IGFjdHVhbGx5IGRvZXMsIHRoZW4geW91IHdh
bnQgdG8gY2FsbCB0aGlzIG91dC4KPiAKClRvIGdlbmVyYXRlIGRlZmF1bHQgdGVzdCBmaWxlcyBp
biBhIHNwZWNpZmljIGRpcmVjdG9yeSBvbmUgY2FuIHVzZQoiT1VUUFVUIiBpbiB0aGUgbWFrZSBj
b21tYW5kCgogIG1ha2UgT1VUUFVUPSJ+L3Rlc3QvZGlyZWN0b3J5L3BhdGgiIHRlc3RzX2luc3Rh
bGwKClRoaXMgYWxsb3dzIHRvIGdlbmVyYXRlIHRlc3RjYXNlc19kZWZhdWx0X2dlbiBpbiB0aGUg
Z2l2ZW4gb3V0cHV0CmRpcmVjdG9yeS4gZGVmYXVsdC50ZXN0IGZpbGVzIHdpbGwgc3RpbGwgaGF2
ZSB0ZXN0IGJpbmFyeSBwYXRoIHJlbGF0aXZlCmt2bSBzZWxmdGVzdCByb290IGRpcmVjdG9yeS4g
CgokT1VUUFVUCuKUlOKUgOKUgCB0ZXN0Y2FzZXNfZGVmYXVsdF9nZW4KICAgIOKUnOKUgOKUgCBh
Y2Nlc3NfdHJhY2tpbmdfcGVyZl90ZXN0CiAgICDilIIgICDilJTilIDilIAgZGVmYXVsdC50ZXN0
CiAgICDilJzilIDilIAgYXJjaF90aW1lcgogICAg4pSCICAg4pSU4pSA4pSAIGRlZmF1bHQudGVz
dAogICAg4pSc4pSA4pSAIGFybTY0CiAgICDilIIgICDilJzilIDilIAgYWFyY2gzMl9pZF9yZWdz
CiAgICDilIIgICDilIIgICDilJTilIDilIAgZGVmYXVsdC50ZXN0CiAgICDilIIgICDilJzilIDi
lIAgYXJjaF90aW1lcl9lZGdlX2Nhc2VzCiAgICDilIIgICDilIIgICDilJTilIDilIAgZGVmYXVs
dC50ZXN0CiAgICDilIIgICDilJzilIDilIAgZGVidWctZXhjZXB0aW9ucwogICAg4pSCICAg4pSC
ICAg4pSU4pSA4pSAIGRlZmF1bHQudGVzdAogICAg4pSCICAg4pSc4pSA4pSAIGV4dGVybmFsX2Fi
b3J0cwogICAg4pSCICAg4pSCICAg4pSU4pSA4pSAIGRlZmF1bHQudGVzdAogICAg4pSCICAg4pSC
ICAg4pSU4pSA4pSAIGRlZmF1bHQudGVzdAogICAg4pSCICAg4pSU4pSA4pSAIC4uLgogICAg4pSc
4pSA4pSAIGNvYWxlc2NlZF9pb190ZXN0CiAgICDilIIgICDilJTilIDilIAgZGVmYXVsdC50ZXN0
CiAgICDilJzilIDilIAgZGVtYW5kX3BhZ2luZ190ZXN0CiAgICDilIIgICDilJTilIDilIAgZGVm
YXVsdC50ZXN0CiAgICDilJzilIDilIAgLi4uCgpTbywgYXJtNjQvYWFyY2gzMl9pZF9yZWdzL2Rl
ZmF1bHQudGVzdCB3aWxsIGhhdmUgJ2FybTY0L2FhcmNoMzJfaWRfcmVncycKClVzZXIgY2FuIHRo
ZW4gc3VwcGx5IC1wLy0tcGF0aCB3aXRoIHRoZSBwYXRoIG9mIGJ1aWxkIG91dHB1dCBkaXJlY3Rv
cnkKdG8gcnVubmVyLiAKCiAgcHl0aG9uMyBydW5uZXIgLXAgfi9wYXRoL3RvL3NlbGZ0ZXN0L2Jp
bmFyaWVzIC1kICRPVVRQVVQvdGVzdGNhc2VzX2RlZmF1bHRfZ2VuCgpJZiAtcCBub3QgZ2l2ZW4g
dGhlbiBjdXJyZW50IGRpcmVjdG9yeSBpcyBjb25zaWRlcmVkIGZvciB0ZXN0CmV4ZWN1dGFibGVz
LgoKPiA+IEZvciBleGFtcGxlLCB0aGUKPiA+ICtgZGlydHlfbG9nX3BlcmZfdGVzdGAgd2lsbCBo
YXZlOjoKPiA+ICsKPiA+ICsgICMgY2F0IHRlc3RjYXNlX2RlZmF1bHRfZ2VuL2RpcnR5X2xvZ19w
ZXJmX3Rlc3QvZGVmYXVsdC50ZXN0Cj4gPiArICBkaXJ0eV9sb2dfcGVyZl90ZXN0Cj4gPiArCj4g
PiArUnVubmVyIHdpbGwgZXhlY3V0ZSBgZGlydHlfbG9nX3BlcmZfdGVzdGAuIFRlc3RjYXNlcyBm
aWxlcyBjYW4gYWxzbyBwcm92aWRlCj4gPiArZXh0cmEgYXJndW1lbnRzIHRvIHRoZSB0ZXN0OjoK
PiA+ICsKPiA+ICsgICMgY2F0IHRlc3RzL2RpcnR5X2xvZ19wZXJmX3Rlc3QvMnNsb3RfNXZjcHVf
MTBpdGVyLnRlc3QKPiA+ICsgIGRpcnR5X2xvZ19wZXJmX3Rlc3QgLXggMiAtdiA1IC1pIDEwCj4g
PiArCj4gPiArSW4gdGhpcyBjYXNlIHJ1bm5lciB3aWxsIGV4ZWN1dGUgdGhlIGBkaXJ0eV9sb2df
cGVyZl90ZXN0YCB3aXRoIHRoZSBvcHRpb25zLgo+ID4gKwo+IAo+IFRoZSBiZWdpbm5pbmcgb2Yg
dGhlIHRleHQgdGFsa3MgYWJvdXQgIm5vbi1kZWZhdWx0JyBjb25maWd1cmF0aW9ucywKPiBidXQg
eW91IG9ubHkgc2VlbSB0byB0YWxrIGFib3V0IHRoZSBkZWZhdWx0IHN0dWZmLiBIb3cgZG9lcyBv
bmUgZGVhbHMKPiB3aXRoIGEgbm9uLWRlZmF1bHQgY29uZmlnPwo+IAoKSW4gdGhlIHBhdGNoIDEs
IEkgY3JlYXRlZCB0d28gc2FtcGxlIHRlc3RzIGZpbGVzLAoyc2xvdF81dmNwdV8xMGl0ZXIudGVz
dCBhbmQgbm9fZGlydHlfbG9nX3Byb3RlY3QudGVzdCwgaW4gdGhlIGRpcmVjdG9yeQp0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vdGVzdHMvZGlydHlfbG9nX3BlcmZfdGVzdC4KCkNvbnRlbnRz
IG9mIHRob3NlIGZpbGVzIHByb3ZpZGUgbm9uLWRlZmF1bHQgYXJndW1lbnRzIHRvIHRlc3QsIGZv
ciBleGFtcGxlLAoyc2xvdF81dmNwdTEwaXRlci50ZXN0IGhhcyB0aGUgY29tbWFuZDoKCiAgZGly
dHlfbG9nX3BlcmZfdGVzdCAteCAyIC12IDUgIC1pIDEwCgpPbmUgY2FuIHJ1biB0aGVzZSBub24t
ZGVmYXVsdCB0ZXN0cyBhcyAoYXNzdW1pbmcgY3VycmVudCBkaXJlY3RvcnkgaXMKa3ZtIHNlbGZ0
ZXN0cyk6CgogIHB5dGhvbjMgcnVubmVyIC1kIC4vdGVzdHMKCk92ZXIgdGhlIHRpbWUgd2Ugd2ls
bCBhZGQgbW9yZSBvZiB0aGVzZSBub24tZGVmYXVsdCBpbnRlcmVzdGluZwp0ZXN0Y2FzZXMuIE9u
ZSBjYW4gdGhlbiBydW46CgogIHB5dGhvbjMgcnVubmVyIC1kIC4vdGVzdHMgLi90ZXN0Y2FzZXNf
ZGVmYXVsdF9nZW4KCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
