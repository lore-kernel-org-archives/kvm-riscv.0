Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A45DC0218F
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgz96iw8FzYV40lho2mXmbPlWSaVojVmmYEx369IknM=; b=JARXHJIg+zkH7G
	DjRtIqL1qB+kTxLHNF4F7Lqs4+ROdUcjW8XAkGYEluzMDWjk5Mxhl9gE8OI0idmk5ESyKOfYaEtKU
	QrN8OZus4w/uWKD57jvv3qJiOz5cLlEujOTANB1JuJifWokBULeAhMS1QPsOVRt2E0/5EcqBEKFOQ
	5g2MQMcFWSUoIhaEiEdI8Hy2P7s0tRw5njN5BXSvTkM+iYpEQFj32r9dhZWs52nXgpZ+mE0ldZYLY
	rUHtdxC7BvW53f/THWu7RN5BKJPmygN9Y1z6K1Xi1+ozCPFDa06mDcF0Zn9HhHQWiRCzSpTldBQna
	fVwcqzn8YWR+fL6hAxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCWy-0000000HNEa-0o7y;
	Tue, 04 Feb 2025 06:35:32 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCWv-0000000HNDI-3LK8
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 06:35:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso6730687a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Feb 2025 22:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738650928; x=1739255728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMHiHPDNCUJ48N5qcuZlI6iRMY6kpg7JJf8A3gbeaKQ=;
        b=TKjkdgzjxs/RHi6ymx6QP13o8xA4c3+ueMsC1WaCgroMb1w4zTUWR3rgajq4tYdiQE
         D6Ss+GnsePAYB7PqeVEQdCkBn+Cdm/snwnxK4f4YGsScaQXCd+bKMVvFQrfJJa9el442
         v9EhGwdkt3/F6v+HVd0Ls0+TubA+fywgH7RTiZtxA96po4gDiWuPAnvtJmgY/9o+l2Y9
         fUPdThTzudwk5OiMTUfCb0aM9bAydyWDDTGOz1KDB1iDih1S1SwtDJ82pOEvbM/QtiQU
         Ybsp4oIalBcyf72LosDkWQ7JDmWR7JzQ+0ezkM4HGlCyx4goCkOAr9l9eueZ4tvPZH6f
         mXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738650928; x=1739255728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMHiHPDNCUJ48N5qcuZlI6iRMY6kpg7JJf8A3gbeaKQ=;
        b=m8nFSvsbHssHVHyHMFUSc4arEikBYaX/e10Q8b+h3H9U9GzdiAWs+wcDseFZZPjuWJ
         69QPZ9BHGZHQNy56dx+D2u8bjEr7vMyMi35kJdlQWm21OgukdqSqHQ39uIPOzUozOS/p
         HD2F1KIQ72rbSiECMRcR/wzcV1ee1YJY45ZxZroa2yQyCDNShC8rED8EgBN3HE0AAtH9
         YT4bLVWMx/PyQXQQP+EcqCgc3wV6/ZHluloE7HWRPfpjEtzdhsDrlJdlFOo88ZNglL/G
         9PcRB9EynvViswONyEZKx0F/ak48Uq2IK0ql6IvBQMXBlDY1vxF3pmoPZPloi/CARd2v
         /85w==
X-Forwarded-Encrypted: i=1; AJvYcCVKhq1hycUtZ/sEc7nOCYrNbTRYiPzOgWhRS5E8HY9A7jdcG3p+PfGUqFCHeXg0SHEy6gxSJefIdaw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo4V3Ey+aOwE4trTFxd+3aIoG+nXjEFV1r967mBQ+60Ogyfq7w
	z3rTa6vZsaYmUpAGHbhaunqW3bdm7IC3nngtHTaUJUNEVkFMDOzpcg0KENHBV8RX9LgdiFPTHdz
	vz++DzEGHkp3w3Rm7/XuN0fEirKTWZvn5rWwqVA==
X-Gm-Gg: ASbGncsL/HF9W8nALObKEK2cOBrnRfTr1N5rvJrofpNXvwjfg+dOn/+fCdT1fdJQsAJ
	SR1GLX3rr0zPMsr70izsUwG/aYRbMXRETESAbOtD5AYWepANR+WRaD5UoEKvpc2T/BcQoxf6ckG
	Q=
X-Google-Smtp-Source: AGHT+IFG/yEpW4K/pBHBk3/3BqLXGkFedpykl/V/VPy5N/H80JyAnUu1lUWvkGlaAAzc1oYTPiZqDlNAWdxjP6mgSAs=
X-Received: by 2002:a05:6a00:2d8e:b0:725:cfa3:bc76 with SMTP id
 d2e1a72fcca58-72fd0bce05cmr36986225b3a.4.1738650928448; Mon, 03 Feb 2025
 22:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-9-64894d7e16d5@rivosinc.com> <20250128-jubilance-mosaic-e3a81199aec8@spud>
In-Reply-To: <20250128-jubilance-mosaic-e3a81199aec8@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 3 Feb 2025 22:35:18 -0800
X-Gm-Features: AWEUYZmuaq61PKoOBoJPiVshD43YM3UyPResBSMNdOEGC5qC9mJGFE-MKtc9ZW4
Message-ID: <CAHBxVyFVYwQ=aiB+RBrQNMQiu4K4uzPgyz8Tn=dUjeN8KKd=sw@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] RISC-V: Add Smcntrpmf extension parsing
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_223530_102356_D2E43FCB 
X-CRM114-Status: GOOD (  17.07  )
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMTA6MTHigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMDg6NTk6NTBQTSAt
MDgwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiBTbWNudHJwbWYgZXh0ZW5zaW9uIGFsbG93cyBN
LW1vZGUgdG8gZW5hYmxlIHByaXZpbGVnZSBtb2RlIGZpbHRlcmluZwo+ID4gZm9yIGN5Y2xlL2lu
c3RyZXQgY291bnRlcnMuIEhvd2V2ZXIsIHRoZSBjeWNsZWNmZy9pbnN0cmV0Y2ZnIENTUnMgYXJl
Cj4gPiBvbmx5IGF2YWlsYWJsZSBvbmx5IGluIFNzY2NmZyBvbmx5IFNtY250cnBtZiBpcyBwcmVz
ZW50Lgo+ID4KPiA+IFRoYXQncyB3aHksIGtlcm5lbCBuZWVkcyB0byBkZXRlY3QgcHJlc2VuY2Ug
b2YgU21jbnRycG1mIGV4dGVuc2lvbiBhbmQKPiA+IGVuYWJsZSBwcml2aWxlZ2UgbW9kZSBmaWx0
ZXJpbmcgZm9yIGN5Y2xlL2luc3RyZXQgY291bnRlcnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgfCAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IGluZGV4IDJmNWVmMWRlZTdhYy4uNDJiMzRlMmY4MGU4
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBAIC0xMDQsNiArMTA0LDcgQEAK
PiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQgICAgICAgICAgICAgICA5NQo+ID4g
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NDRkcgICAgICAgICAgICA5Ngo+ID4gICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9TTUNERUxFRyAgICAgICAgICA5Nwo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9TTUNOVFJQTUYgICAgICAgICA5OAo+ID4KPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WExJTlVYRU5WQ0ZHICAgMTI3Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gaW5kZXgg
YjU4NGFhMmQ1YmMzLi5lYzA2OGM5MTMwZTUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ID4gQEAgLTM5NCw2ICszOTQsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRh
IHJpc2N2X2lzYV9leHRbXSA9IHsKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtbXBt
LCBSSVNDVl9JU0FfRVhUX1NNTVBNKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNF
VChzbW5wbSwgUklTQ1ZfSVNBX0VYVF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAo+
ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc21zdGF0ZWVuLCBSSVNDVl9JU0FfRVhUX1NN
U1RBVEVFTiksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NW
X0lTQV9FWFRfU01DTlRSUE1GKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3Ny
aW5kLCBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5EKSwKPgo+IElzbid0IHRoZSBvcmRlciBoZXJlIHdy
b25nPwo+ICAqIDMuIFN0YW5kYXJkIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9ucyAoc3RhcnRp
bmcgd2l0aCAnUycpIG11c3QgYmUgbGlzdGVkCj4gICogICAgYWZ0ZXIgc3RhbmRhcmQgdW5wcml2
aWxlZ2VkIGV4dGVuc2lvbnMuICBJZiBtdWx0aXBsZSBzdXBlcnZpc29yLWxldmVsCj4gICogICAg
ZXh0ZW5zaW9ucyBhcmUgbGlzdGVkLCB0aGV5IG11c3QgYmUgb3JkZXJlZCBhbHBoYWJldGljYWxs
eS4KClllYWguIEZpeGVkIGl0LiBUaGFua3MgZm9yIGNhdGNoaW5nLgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
