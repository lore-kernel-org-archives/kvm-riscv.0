Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4B7CA6019
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TevGaRT9CLQTo5dHrsU2Rxx/KvVY6I69vnSN+eG4Xg=; b=o//hIA+0oDg5Jj
	xU5TlXOyciPW/jsTRlp7l4TuONccEGeRaCJDUzgordWje1Us4ZGv/CXXfQY7DgFEotvHtzMjHqR2B
	va9V/FqwxYIDM9ppIbfXwSALpOCIoL4EUuU2CExpUQe8LhxNKCuF2i0jI8mUH2qXPK2OcQQyPBLef
	Z30egqCq4bUXhrEJlnGu1Y0HRyzYpCYX17hQF6VIsZ5jqBoOKTzMl2MoyhNIN9pYgUzvkD7H3HIJF
	Cb8CiU3wRFyKHJBOnS6w7P3Ri9PeFJbhAjViQE3QzB6a+a7KFYaJiRS+r6fL0rQS5VBc5aPFsantn
	ra0H1t19ZD4B68YxS3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7op-000000063YC-0oJd;
	Fri, 09 Oct 2026 10:27:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7on-000000063X3-3TiX
	for kvm-riscv@bombadil.infradead.org;
	Fri, 09 Oct 2026 10:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=; b=NJ8VGHyEQ+Ge3vV7dTzlNnEI8F
	nYHz360w2ss3R6lr3N5lbJdkRZb8UEffiS4zoFTMnpWd5OmbILmARTjL6IUNxWtn8268/cQrZZq1+
	pIqlAXSX3MSBRNTHifNcdL6zAy6yjqvwSElBjt+OOi8MtDtaWURwJD1s32g2T/IPOlZ3BHb/GgmJT
	NZhguJ6aRip6W2OcHOxT7aW6b06AX0A3WQZk2szf/nUF3178yENziQzeJY91CMO6NEnSBu83dPEPY
	Q7oYQbUsXRSVt8y/UCJiqGMIZ5vH2Qy+1q4iCbndQjgZcUY/XLDiKK9CmXQhWJfd7CRVbOXuCN0pk
	tFjY7KMQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF7ok-0000000B7iF-3nZK
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 10:27:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so64714555e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 03:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791541629; cv=none;
        d=google.com; s=arc-20260327;
        b=UovA7wW/r+KWwv/aSrixc03PEtLt1fCs1w61+X6/VQcXfvCArZSLODHG728QHVlpXt
         7+R2zdo55Qys0/QVgU1HaDOLIHV9Z5lmBDUcrM4/Ul0RYgtl2gOm/VhRaYPuWNkqnJQ2
         o78BSgHGtr0EYr4juyIeJlyIY5uJ4yqISCTjP7cgL4KLPHTvW+SQXXpZJjXbwbXUmwur
         SYOKsUvCViEOtRN3kfbTPbH0MDTTv6OiWWwapNpZaLsWomPatkjckpvMPdY5rAGTFdqp
         XJ7U07P3C9HadL6WN+RlSk8e4k/laBHOS67xPQwvmRbfZxMKgjzNici2HS59DGG4NSeq
         1D7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        fh=Iv2ws9j5Svu3nnAMsZmQbepRFX4CJrNjztUWG9MzRuI=;
        b=kdSxaeBRxbjrt/wN4PRkin0J56gVQ/s0DsvRvl9uKD8JZZMjROfbcGeQAtDhw3KZfb
         sAbS3LeoKsjJJaJynAty6lf1aWpRt4Fmy0neKgdhv47LwQrEmqxiVkUcKcbXmX5WUkjK
         uzNzXf/+bBDsX3VZYH350j6OoSKPVZt4hLM8QPbNoIIFonUcmJ5UyyQlmmEPZyOTitwU
         wpbURNYNe6hqyFGdAzU08/3/sKPtrwoz7uPgOl2BpazceontVyevLFi+iDXA5OxAM/7d
         OJgHAU4XUIbBtkPel7ibZu8FS4KeRRTBkUHczBViSLCy0plStemtPpxm51i+1Q0t9io+
         K70Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791541629; x=1792146429; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        b=VvMygRiMQWbNaNSeOpA7jSZxQxPQTLJizLJguU7Nx+3lCVZ+mu1CL6+n/jlyz15HDa
         9uYXV0CsZF12VfmgjwoG5Tf5N+1J2hplvwSQOw2sXjO+gqW37vW8QdgO9JRiALE6ZHc1
         f0gK20oPyuxQ9E8jhF+dt1kwcipircQGdcUpXbhjw91R9UKm9Zw5yNeMKpRf7G+CNfAD
         1N+1BwzbdH1rZjib+rMPEBzxSD/8JcFSvlCrb0ZTFT7VmmFHKhtxgfAJcKICOdlj+bzh
         OmAyo6MWAQ9z2X99VD2Stu+R59A4HZI5EGqqpjWE8/268tSC9ZkTruHFpJUKDTKIq+xf
         +mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541629; x=1792146429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        b=fNrqMgrMWOzLZrUYirfzq0SrACfMUWtH94FehcUAlPt7ZX3yU7WMNe6I9NbvFe2fps
         K1Y4c9MZ0DR86dzNiE3/x1RARNyyckzIJZs0vYnsIc43Uyb+aRS120H4uOs4zALIsmAA
         hq9vVwG9ZbubAtrvwuNNR2O68Md9tklP949CTcxNMuCvyuHa+BFoKT6rTESPSw5qqiCr
         6nil5fSZRW4BhWNgn8IpeK/I3x9zipTAAD+5skwFzQx7yH/Wj3mWZEQ+OHjpzOd+3tXq
         +yAiClASb8tL2XSqY5ROjRa4GbTNEcQJ/DapqBmp2eRGA1fGVP9prSCh+jd2WOgk68tj
         ASWw==
X-Gm-Message-State: AFuF++mWsNHcDBfdbM7F25ikTYN61MjcvPB4EXBwYBN/2CcSYxGvQoHj
	6LDd1zVGV7LgLNwYGbv3DeZpfkIMLRCAPHfcV3KxqrmuwR5JCIzYM1ZAmpckmN20mA+uf2chnJI
	Yg3OuXj8lcLXq19UL1tcZeMvJ/zysaHHrInBeH1mCZA==
X-Gm-Gg: AYBFou3F/w7qLXB6b6UjS+N7FJxmNfzb8hXJZLDMMWP9Kf5Ob0RGVqMGdRUwwZHvMAs
	6gU5hhvT2XxGhj8xDwJk0Ow7e+9mA+cAvhDeqBuonvbt/0tNPY+iNmMTI3ZUW28LVEAT+Is5oTE
	WoZ4Ac/0AaZ26hjPK1a0T5OhnC7JTVbny0YAQJADbsQb9hIb71XA0shI7CWNU5qn0TmjOzSjNLv
	sP11iFUWspDBuVG1am3ItsmqZfoCQ0dvIE1QNELvXJbo36G61kBlEm7A10LOiFAPV0BGlzZ0gRd
	Yk3/T6kGGnV5/8ALV4e97QhAOE+om3rkOSJh/PPhEgqir8zSo2mZvyBRj20qtmq0afJcaXILN2t
	vtaggSc9US96nQgHMBJaKsorSas9KQVT4ojZBN97sX7U7zxCIpqZEosQQ12KFngGS06zFbQ/DMg
	==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id
 5b1f17b1804b1-4a18e4a5355mr31129155e9.10.1791541629095; Fri, 09 Oct 2026
 03:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:26:57 +0200
X-Gm-Features: AclHuK-pEq92e8PF3NtgM83whKL9xC8DLhFEcuppkWWmzGxqa0y5mveDAWbf6kU
Message-ID: <CAAhSdy2xu2MAKwOfPNRPG68XbtQsa-CT66phvTZe_XD_3Rk3Qg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Reject vCPU creation after AIA initialization
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112711_043640_714D1ECA 
X-CRM114-Status: GOOD (  17.71  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgNjowM+KAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQUlBIGluaXRpYWxpemF0aW9uIHNldHMg
dXAgcGVyLXZDUFUgSU1TSUMgc3RhdGUgYnkgaXRlcmF0aW5nIG92ZXIgYWxsCj4gb25saW5lIHZD
UFVzLiBDcmVhdGluZyBhbm90aGVyIHZDUFUgYWZ0ZXJ3YXJkcyBsZWF2ZXMgaXQgd2l0aG91dAo+
IGluaXRpYWxpemVkIElNU0lDIHN0YXRlLCBidXQgS1ZNIGN1cnJlbnRseSBwZXJtaXRzIHRoYXQg
c2VxdWVuY2UuCj4KPiBSZWplY3QgS1ZNX0NSRUFURV9WQ1BVIG9uY2UgQUlBIGluaXRpYWxpemF0
aW9uIHN1Y2NlZWRzLiBCb3RoIHBhdGhzIGFyZQo+IHNlcmlhbGl6ZWQgYnkga3ZtLT5sb2NrLCBz
byBjaGVja2luZyB0aGUgaW5pdGlhbGl6ZWQgc3RhdGUgZnJvbQo+IGt2bV9hcmNoX3ZjcHVfcHJl
Y3JlYXRlKCkgZnJlZXplcyB0aGUgdkNQVSBzZXQgdXNlZCBieSBBSUEuCj4KPiBGaXhlczogODlk
MDEzMDZlMzRkICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBkZXZpY2UgaW50ZXJmYWNlIGZvciBB
SUEgaXJxY2hpcCIpCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNA
b3NzLnF1YWxjb21tLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywK
QW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMyArKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IGUwNjJjYTE5ZjlkOC4uY2NmMmRl
ZjgzNGYxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC0xMzgsNiArMTM4LDkgQEAgc3RhdGljIHZvaWQga3ZtX3Jp
c2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGt2bV9zYmlfcmVzZXQp
Cj4KPiAgaW50IGt2bV9hcmNoX3ZjcHVfcHJlY3JlYXRlKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWdu
ZWQgaW50IGlkKQo+ICB7Cj4gKyAgICAgICBpZiAoa3ZtX3Jpc2N2X2FpYV9pbml0aWFsaXplZChr
dm0pKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICsKPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4KPiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
