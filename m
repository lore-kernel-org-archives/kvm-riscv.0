Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AB8C53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrAziU+rIL+L4gp3yCh+wkBCbmLN+eIIK0qThiX9qLM=; b=Qbo/CdmkLbfcvt
	4MKQ4Xh61pF57gZMB54R0Oe0Ksz5iqJrc7q5SwVlWHNJ7HEjNMkrlCinJQT+w2ijUhLPWOKsJisUk
	iPW8r2ofXWM73cYq3WLkK5MNtwEqum8nvZclHnsZ/nInkcBMdhc0nsv4ZaTBW/LIe841M9qg9hr1L
	f7lGzMtlHKo1s7LmlxY/YdsBhwCE+XiJV8jNDUJGlE9ao+l3uvWmEjfANqTX+bzfYOXQjIhwYBDyo
	qoB6BLTPLz7uLXfddNrhvm2Vu/JkEuYyzWPGOquB2hdNkDTSn/UTfGCtNK1DCtbwbuYA+RzEzxWpg
	eP9gVzPksK+4yVGmBCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozD1-00000007BI6-1zKt;
	Wed, 29 Jul 2026 08:00:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozCy-00000007BGn-10qM
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 08:00:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso539230f8f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 01:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312006; cv=none;
        d=google.com; s=arc-20260327;
        b=CmDOgYXJpp+AHXziW19shHW7/UZPeBQROIXgu/aFx5483dh53eP6b9lUzPkTMVLdEx
         D/oGzp6VmLoaj/ZBtw0ChAHivK7g2MS7VfuM3HW0VvfgM2EtlP//M7+MCAjxGXO+OInE
         7fxftAuyEhjce8G38SkF11loykAXehCAXdtqwW+NDx2FAAD3TqemTOaYkg6yQ/M7uon7
         zjeSEhLmWwTDPE62uWMXECWxl1AqF6PgedexOYooT57tZvsVw/6dYg+xxOQEhf7rmYR3
         yS5R8+jdFRWki9RbGQ0+nDJ+LGYBuOwpjiA8gB4Xv23ZTNGSiauKohfcWXst4259AUPD
         mKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rci5JZNGuacWnB92Os9ssONVUy8Ji8/sE2wdKdAgC1Y=;
        fh=S00sPgxI15Re16dIPiTJ43mHY0jrPWtq64rdozzJumU=;
        b=rCwldTM2a+5h643Q6xxNxQ8AUtmLWa+YYQNJCMPlr+ZH5mUtCj8RO0CgZns0B+1fap
         zNqKhwvBM/xhMstyP+gelJa/buovFk2NEAdLwD4i5RbvGTa9xiPBEVf+9CAgbmerqm2Y
         pe2YPPuGFdSPEp94GzLBx1EyN3FH3xPrlTpujH2XoSQeCL95GUtakZGtyoxZDOmEgfh8
         MWp2Pq3JMUsCb8vIB9dmY9hsgYb/upDcli7jEtSM0idXQ0KOYsokQhjU/480RHPB/Ne2
         tsm1xDvx7cc5xRNet5glJjNEU/jG/5tPmfGx79QZvUKPx6LXR4kwSi8ZDtZ4pqUk+RXg
         BBnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785312006; x=1785916806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rci5JZNGuacWnB92Os9ssONVUy8Ji8/sE2wdKdAgC1Y=;
        b=tCfIfR1Z9XXXKUVFbXVCqNHQk9bM7VI7qWmCT7pCPWeAJ9hwPb4Ne5nBGOgButXhf1
         bAeVeoRjGBevexHURpK6bfcRTPD9niOYtuBi9ZI04R2TUNOZnO2TOcQweGCDwhhxccBf
         HtPwWsYEWhuumWwA3MITXpBS6xIkxdR1P5hnRv9pccVZa4XUYQlsMuF3scxtuZEA86OW
         PMnWqtz1/oeG10FK7TfObkxM0sp02jxFS6gfYn/BeDGN1mtisTatFXLIt8pZxSGBph0M
         V+YI004NhiipoTHc2NHUwDyLPNAT0a7i9TcR383sEvNfz554CP/Am4pWPuzp2Sk9bIX1
         2ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312006; x=1785916806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rci5JZNGuacWnB92Os9ssONVUy8Ji8/sE2wdKdAgC1Y=;
        b=i27aknFi2gOkTVCqTZm++c1v9cJh+dFT3t6vvib1O0r+UfYc1tqEgy1XIAcINjOLX2
         XpRTzcxBPX5rj6wvqwKU4NAtfCjNXGtf/7Pd03NvGgwcsd5cV1Dpz7vvjeOOQk6fYV/a
         OmIPWlxNBE5pJtRaO7D5E88bG4X+kr0qtr4bjxZ6GxsS+YjaKR0ZH4naxS64p333qjBR
         wtFx/3W98xc4pNpxU2+jL1C0C9RbIKw8z+NFqQ+UPg1+iCFf7j60Iua6eGo/I89emahw
         7Q2RQJUzOqWaDgTQBLFv2ujL3exfbbwyUuRTlobh2tgoPIupVZf+zaSmJXEBOmP659ru
         SvZQ==
X-Forwarded-Encrypted: i=1; AHgh+RotEsZSWtF8pEi9e/Z69EKpuK0K6WuT7bxoYOUrff727q+Tb09unD5dmFbxlmmxQ1zcMN2v3TZ2EyI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDReNIf9cEIBlJ8fsfGbU3L8s29Z8/qlBXV1zXwlhxdfsqr3qg
	PFI83VFVc07q7FtgaZNRzD+N/ggBIJT2aSlOzshO515OHsmBH6xoX01vRjd5T8pPBCc2X1Mvtq8
	1wmPZII4IpntoO+RRuRJVFYdT5dpGgpYn/36SeJOkRw==
X-Gm-Gg: AR+sD11d1EXyFfXQ1x+HJFjVvBcEg+hCoO2Mt9vrBppE4atnliGj17JJs3Gra/4bmE9
	w621vrQpq3zM/6FDp/nHS8g4pSJnQTDmcK6FuYKVOVizVPS3LPxiYWYcJtfPsB0NPD51+U6E5Gl
	OC3YTn1A6Ez8VohJ96hZTEAbDvqqIx6UFSUib1WI7dUdEqFSlMHRmXf7Nzgm+QmA4HQMN8aMD75
	RXmIlhvfztlTVpYcmkA4sU7igBnXkCuzDkKJrFPcqnqcCtyk6PtWzUTY3CNTMUa+GmhB+ncPeyb
	szRiU0kHdGvww2ViwWBg2cgFSjDwHz14UOPuY20CsKKcR7hrLKBqY798iSZoLU4M1tQJgwE9L++
	FRFPaQKPjh7fZBu1SR+tZkJ5iARrIV8/uFjw7mx0gwXIFTPlLLvbbUcQ4I93ywGVI+Y6R7W0CuQ
	==
X-Received: by 2002:a05:6000:2305:b0:47f:9cc2:ddd2 with SMTP id
 ffacd0b85a97d-47fb1f12564mr6605912f8f.35.1785312005784; Wed, 29 Jul 2026
 01:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260706021154.210289-1-inochiama@gmail.com> <20260706021154.210289-3-inochiama@gmail.com>
In-Reply-To: <20260706021154.210289-3-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 13:29:54 +0530
X-Gm-Features: AUfX_mzA13dUOuvRHNAI3CYEINk5v4YYOQCfEpDt04tRyGPj1v-cqDo2CrT7xfE
Message-ID: <CAAhSdy2roJqQGtCXjfm4WoeSbXxMt5GSk_WO=4fAvJ4WEbjYeg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] RISC-V: KVM: Add SBI FWFT validation support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010008_491932_B935B90E 
X-CRM114-Status: GOOD (  17.27  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA3OjQy4oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB0aGUgS1ZNIFNCSSBoYXMgZXh0ZW5zaW9uIHBh
cmFtZXRlcnMgdmFsaWRhdGlvbiBzdXBwb3J0LAo+IGltcGxlbWVudCBpdCBmb3IgdGhlIFNCSSBG
V0ZUIHN1cHBvcnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFA
Z21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYmM1MTRhZTY1
MjFkLi4wYWExZjlhNTdjOTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTYwNCw2
ICs2MDQsMzAgQEAgc3RhdGljIHZvaWQga3ZtX3NiaV9leHRfZndmdF9yZXNldChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBrdm1fc2JpX2V4
dF9md2Z0X3ZhbGlkYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgc3Ry
dWN0IGt2bV9zYmlfZndmdCAqZndmdCA9IHZjcHVfdG9fZndmdCh2Y3B1KTsKPiArICAgICAgIGNv
bnN0IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSAqZmVhdHVyZTsKPiArICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mOwo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAg
ICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZmVhdHVyZXMpOyBpKyspIHsKPiArICAgICAg
ICAgICAgICAgZmVhdHVyZSA9ICZmZWF0dXJlc1tpXTsKPiArICAgICAgICAgICAgICAgY29uZiA9
ICZmd2Z0LT5jb25maWdzW2ldOwo+ICsgICAgICAgICAgICAgICBpZiAoIWNvbmYtPnN1cHBvcnRl
ZCkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAg
ICAgIGlmICghZmVhdHVyZS0+c3VwcG9ydGVkIHx8IGZlYXR1cmUtPnN1cHBvcnRlZCh2Y3B1KSkK
PiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAg
IGNvbmYtPmVuYWJsZWQgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgY29uZi0+ZmxhZ3MgPSAw
Owo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGZlYXR1cmUtPnJlc2V0KQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGZlYXR1cmUtPnJlc2V0KHZjcHUpOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+
ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBrdm1fc2JpX2V4dF9md2Z0X2dldF9yZWdfY291bnQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1heF9yZWdf
Y291bnQgPSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdCkgLyBzaXplb2YodW5zaWdu
ZWQgbG9uZyk7Cj4gQEAgLTc1Niw2ICs3ODAsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2Jp
X2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfZndmdCA9IHsKPiAgICAgICAgIC5pbml0ID0ga3ZtX3Ni
aV9leHRfZndmdF9pbml0LAo+ICAgICAgICAgLmRlaW5pdCA9IGt2bV9zYmlfZXh0X2Z3ZnRfZGVp
bml0LAo+ICAgICAgICAgLnJlc2V0ID0ga3ZtX3NiaV9leHRfZndmdF9yZXNldCwKPiArICAgICAg
IC52YWxpZGF0ZSA9IGt2bV9zYmlfZXh0X2Z3ZnRfdmFsaWRhdGUsCj4gICAgICAgICAuc3RhdGVf
cmVnX3N1YnR5cGUgPSBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZULAo+ICAgICAgICAgLmdldF9zdGF0
ZV9yZWdfY291bnQgPSBrdm1fc2JpX2V4dF9md2Z0X2dldF9yZWdfY291bnQsCj4gICAgICAgICAu
Z2V0X3N0YXRlX3JlZ19pZCA9IGt2bV9zYmlfZXh0X2Z3ZnRfZ2V0X3JlZ19pZCwKPiAtLQo+IDIu
NTUuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
