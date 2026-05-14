Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC88CD4851
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv9hBQeM4M+rU1GlswwnBHPK/KRm/Vhkp2Bo5nKGwtE=; b=wF3Hbn9Gk1ZPHY
	E3FXwvuJbLtkKMnwbHay0UB0e1k2OMRscuny+o7dN48bGY3iX0E/BpZgNMi7ARYnWISalu3KsKNLN
	MEgpPby2aii2/EcEurGckpFbgYNQhU8EdBZe59yR/u3IvtmvEG47alDvKEX99nvvlOGLU+MYpRvdA
	E8i/EAg2gmwVIt16snhCSTXwZzU/5kRwtWJROP3yE0H1cd+5XDmmIRX4fQl3TNlcFBk+d6wPNDXHR
	SFLK5uaKEgnw8GLQm/okslW1jjgELKaGoTAimsm3zbrDaQ+szFRoNVJvVvjv8kLa6PFbAbM1hhHfv
	CYF12LKU/TtiW69y6U1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYQV-00000005xoA-38HW;
	Thu, 14 May 2026 15:56:43 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYQT-00000005xn9-0RS4
	for kvm-riscv@lists.infradead.org;
	Thu, 14 May 2026 15:56:42 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6841e6a5e51so4042710eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 08:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778774200; cv=none;
        d=google.com; s=arc-20240605;
        b=N0U6Hv9R1iRhGDRzSd80NNVSxqVmRauWnIZxW/ZBTlWJramr+p3O8xbYTLGk6Q7k8Q
         EeIx+n3tQX17SL8UY8T5SI5vGh14rWlIBGuFyQ3U0TOAQCSYQFEo0EU7f2GYSVSPw8yB
         fKako+WYfvo78ZPCu9tv43U7+9ev2XZ72RLjL8SWyyLynBxOY/dlPo/1P4XD9gzt1Geg
         +jAM0bgmX4j/FTuof194mLw9hIObx82KcY1LSyltIBGzlwt5W8HKu0Rv3mGXhUHeq3h9
         f7NJUOEq41B57EjEzkPzJ9sdQxeGRKTHDUjE0W5pzpHi6+yliDPyzMoHOUtDW2fexZ/q
         vCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uCT6HXYhjKb/dFCYEBtj0FV6pBWcX+E/ZnHhtNgfIE=;
        fh=CLMNehkyYmd5CK5IsiL5mRzW7bJz1HLtNX1ewKD9fB8=;
        b=caJRugRS4iJnxdPVRJjTyfeOlhd0lb6bL36xa/RuuJNREkTEuULcq41BY022vDMcKM
         PRbyPNJ8J0pVYIJSo2+fVuzddI6K0C9Fj0y0RuTvRx+rCYI8fg08mje+TH/3MQYIT9FX
         Or4VLJ+wmGDp5Z2W+qs6QlON0qqNrUxi9/SjbruH7pw8VS1HKqt0hEOdHNXR+qccf/EI
         thbdfVduQcuwg1LYaMtnnqFDMSs1ey4xCq7pFNUiYb7tvUIciojQXtxaz6uDy2Q5UgT6
         BbB0k9Nu06U22T2AwQtSJbA6DLWaD3+Htx+oR4lkw6vjvtQAWciun53eSi5j8hpkT4dH
         LpoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778774200; x=1779379000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uCT6HXYhjKb/dFCYEBtj0FV6pBWcX+E/ZnHhtNgfIE=;
        b=pvbdfxaJRnhj5sbktTLaZsh3RtHsAhbqQFEfcQgzHKudayWF/eTM4/rqlKb2kqHggL
         IR+adoWiEGn/eeATmh+Nw9PxHHAv2vas6ha8lWTsglNGxPgAPmu9aw1S9sb1P9WJUsAB
         VnMS7YY7EygQh7Sypp8fc3afsA25msxqyKgrlEeiwTgZYXxX8R4Qi1fY09G6/W6fheu9
         OE1+Ofhy49iSykSAE1I2xMtqpvDHG092ZY0cr5vqD4O3NkpmUjAoy294dXlOhmSmLE2q
         Kdu7YPItzXW71RuDr4XRABLBvS1kt8d4FFQHfXli8D5nAMiHbnvo1lmQh7mbC7hhRDAy
         st9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778774200; x=1779379000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uCT6HXYhjKb/dFCYEBtj0FV6pBWcX+E/ZnHhtNgfIE=;
        b=TmogtuF6qL+DSJ13/nRWT+1+JfC9d1wh9RQ08gMdSkTd1S+8+FQgeLIbD12wj81nRn
         NrNHKGSBAt2CuPEy+jgy7AqzgwLFiUNL41KYSbfGkelrSVPW4whrnq0Av5M1PzrH3tlk
         pfA/8hHBm0DGxs26kkcgr4ahE+3+ye6KTvIo7WU5Hu6di+x0o5QZLT0i+LFlC/l7dBW+
         C+Nwl/BrHAIGX551bYtybJvydKeVGWQhQlH6v85QAnByL9+nh4KlJKIj4pz8OfNl5qlq
         CgKJS7qrmrbvgxM5UhjSNZspR5yxpqud2Ahy8gdMfKFX+521XCY8AqmiJWJLadKUIJOZ
         b+Lw==
X-Forwarded-Encrypted: i=1; AFNElJ9do3rlMWYFgvK/D+QeLsGE0EC6KAan7UfKnLgOLKj6SUqXSAwDbK/ep8lnKHqW7/rqwoTY//P2iAY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOtMBSAT+JqNvDo1SjaJYZZhUoEF3p4CBqZ6gQ3AKvecTNf8ql
	DCG9fsd5EiKHpA9ZTxhvFcTYMfZvUH1x6zStSepG1r+9W8VGmqCIT6PvzBpC1epmFqOG85X+MWU
	aILLQAD0/vJKF4g8TwgbzooJgnh0b2xVAEQef7cRK3w==
X-Gm-Gg: Acq92OHLIBEj4Llutb04Y/hAEdWEiG9C5lnSrfL68GW2NOd2as/0j1Vb57BAmgKrIb7
	oOt8bE/o1qWFCCbvJ7NSriMEkPubqDqSX2S9lZIqniy2AJGJl2ktJV+aL/XphffcphM357OM7EX
	NB7YvH6gtvLMNUdTXQ9GeDNytBO/y8Hhz77gFpbr1rbvn0a3wUa8ES7HEVZoOho5yShLYQ2zMi3
	1TJcvBrjf5H/PwLROly+L5ol9h9pgvVh2jIMXr8o+2jOSzHPWF+GLkugkVpoFPQ5WmSUQ8kf+71
	GOYSnvOukSkTEBlXX86dudMI+JCJsRd5IoJDAQa3/zt87Tclvhm4T0b5c7FPF6/EoO0SWLcneTZ
	GwdjL4k3gSKfTe0w7zAD6/YqOQ8gEkMuqM0vXmg==
X-Received: by 2002:a05:6820:81cb:b0:696:1cbd:27b2 with SMTP id
 006d021491bc7-69b78e1431cmr4290185eaf.29.1778774200112; Thu, 14 May 2026
 08:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260509114122.1868327-1-vulab@iscas.ac.cn>
In-Reply-To: <20260509114122.1868327-1-vulab@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 May 2026 21:26:27 +0530
X-Gm-Features: AVHnY4KnO5GP15bm8wpvO_qtJw6UtrK8AXTiAujoajkCIeV2BiTUAo8W-MSSrh4
Message-ID: <CAAhSdy0YEe802RXPbL9aAdVYqj7BCcTXBBmLNnWinHTFohjtGg@mail.gmail.com>
Subject: Re: [PATCH] riscv: KVM: Fix missing TLB flush on HENVCFG.PMM updates
To: Zishun Yi <vulab@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_085641_397906_290C35A8 
X-CRM114-Status: GOOD (  19.09  )
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

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCA1OjEx4oCvUE0gWmlzaHVuIFlpIDx2dWxhYkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0MtViBQcml2aWxlZ2VkIElTQSBz
cGVjaWZpY2F0aW9uLCBpZiBoZW52Y2ZnLlBNTSBpcwo+IGNoYW5nZWQgZnJvbSBvciB0byBhIHZh
bHVlIHdoZXJlIChYTEVOLVBNTEVOKSBpcyBsZXNzIHRoYW4gdGhlIEdQQSB3aWR0aAo+IHN1cHBv
cnRlZCBieSB0aGUgaGdhdHAgdHJhbnNsYXRpb24gbW9kZSBvZiB0aGF0IGd1ZXN0LCBoeXBlcnZp
c29ycyBtdXN0Cj4gZXhlY3V0ZSBhbiBIRkVOQ0UuR1ZNQSB3aXRoIHJzMT14MC4KClRoZSBjaGFu
Z2UgYmVsb3cgaXMgdW5jb25kaXRpb25hbGx5IGRvaW5nIGxvY2FsIEhGRU5DRSB3aXRob3V0IGNo
ZWNraW5nCmlmIChYTEVOLVBNTEVOKSBpcyBsZXNzIHRoYW4gdGhlIEdQQS4KCj4KPiBDdXJyZW50
bHksIHdoZW4gYSBndWVzdCBkeW5hbWljYWxseSBjaGFuZ2VzIHBvaW50ZXIgbWFza2luZyBtb2Rl
IHZpYSB0aGUKPiBTQkkgRldGVCBleHRlbnNpb24sIGt2bV9zYmlfZndmdF9zZXRfcG9pbnRlcl9t
YXNraW5nX3BtbGVuKCkgZGlyZWN0bHkKPiBtb2RpZmllcyB0aGUgaGFyZHdhcmUgQ1NSX0hFTlZD
RkcgZnJvbSB0aGUgbm9uLW9uZS1yZWctYWNjZXNzIHBhdGgKPiB3aXRob3V0IGlzc3VpbmcgdGhl
IHJlcXVpcmVkIFRMQiBpbnZhbGlkYXRpb24KPgo+IEZpeCB0aGlzIGJ5IGFkZGluZyBhbiB1bmNv
bmRpdGlvbmFsIEhGRU5DRS5HVk1BIGFmdGVyIHRoZSBDU1Igd3JpdGUuCj4KPiBUaGlzIHZ1bG5l
cmFiaWxpdHkgd2FzIGRpc2NvdmVyZWQgYW5kIHJlcG9ydGVkIGJ5IG15IFNwZWNIdW50ZXIsIGFu
Cj4gQUktZHJpdmVuIGFyY2hpdGVjdHVyZSBzcGVjaWZpY2F0aW9uIGFuYWx5c2lzIHRvb2wuCj4K
PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20veWl6aXNodW4vcnYtaXNhLXNlYy9ibG9iL21hc3Rl
ci9vdXRwdXQvcmlzY3YtaXNhLW1hbnVhbC9wci0yNDk0L2xpbnV4LnR4dAo+IEZpeGVzOiA0OGQ2
NzEwNmY0YTcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IE9ORV9SRUcgaW50ZXJmYWNlIGZvciBT
QkkgRldGVCBzdGF0ZSIpCj4gQXNzaXN0ZWQtYnk6IERlZXBTZWVrOkRlZXBTZWVrLVY0LVBybwo+
IFNpZ25lZC1vZmYtYnk6IFppc2h1biBZaSA8dnVsYWJAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4g
aW5kZXggMmVhYjE1MzM5Njk0Li5jMmJkM2FlNjk5ZmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndm
dC5jCj4gQEAgLTE4Niw4ICsxODYsMTAgQEAgc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9w
b2ludGVyX21hc2tpbmdfcG1sZW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICog
dXBkYXRlIGhlcmUgc28gdGhhdCBWQ1BVIHNlZSdzIHBvaW50ZXIgbWFza2luZyBtb2RlIGNoYW5n
ZQo+ICAgICAgICAgICogaW1tZWRpYXRlbHkuCj4gICAgICAgICAgKi8KPiAtICAgICAgIGlmICgh
b25lX3JlZ19hY2Nlc3MpCj4gKyAgICAgICBpZiAoIW9uZV9yZWdfYWNjZXNzKSB7Cj4gICAgICAg
ICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyk7
Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV9hbGwoKTsKPiAr
ICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+ICB9Cj4gLS0KPiAyLjUx
LjIKPgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
