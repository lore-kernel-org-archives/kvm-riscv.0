Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CE7CC6B38
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nq8T5AnFTWhTn91CdLoms12x6Vaugh8C7dTN1v/8uDM=; b=gcyrV6QsZJzCbj
	pwW/OX8sFinS9Ntfi+3x/XTsmqGkPvEMiclMfz0HiGNNVvvIujITg4ZR4a3oPMze8MAsz4tCX4usT
	39bsfU7HGTUufqtxzBoLI9zSQOf/j/comz+sXIlH85l4PL29Qm/WBjIfOyxRdb1n3FQcsPxhIJiwF
	bNLnbFdpn3llX7GngP5IbWZ6skMHoQBmAV7cZAHDE4eJSgjJYRx2tCGd05Ungal3eu6622blEGNbW
	jljJrtby6ebomtDV20IfZ/5XAwDMzOWwk/SV3dAiKSZHHp4639iK7cNsU/WHna7KCH5Cw8pND1OtE
	ASt5H6530bdG5ExbWZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQ8S-000000019BD-0im8;
	Thu, 15 Oct 2026 18:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQ8P-000000019Ac-3i4I
	for kvm-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 18:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X4h1CjJh2Pd70gAZyF57+B40XRbkhki100Vx+kKXuXM=; b=FmLd/G+KsKgrROu+ruW49XegUB
	6dTPUhDo+uH7gpiieF+1ZgCIqwpnCvqJ28JfRBW5PA5exwEcwm+hXCjNBoKxZs8fAEVl9m+Zi06H6
	jxPA5UETj/HGdIDLd9AJtebhR+zePHXr3psmTDCgEzSivOF7Ls8dU5ucUboMyNVwdEWlVIwPqUYCe
	KsuAMZwZj53iRHY9KOkWCwCpIyBLl/k41QeNvODFTbWOGW8XX1ylpdsqq3+1SwlSR4XpJsdGd9mWA
	cGwO+UaBrK06WDlHutCGbNjrNl+WM8CTJ/sQ1c6M3iMlxS6TclRlhNrFK47r6pcPRhu1MvUil0k+h
	OZdGmB2g==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHQ8N-00000000jMd-0BVn
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 18:24:56 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-821b5c73292so3989896a34.1
        for <kvm-riscv@lists.infradead.org>; Thu, 15 Oct 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792088692; x=1792693492; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4h1CjJh2Pd70gAZyF57+B40XRbkhki100Vx+kKXuXM=;
        b=V9/GyCL/T6vibqPz0Joe+3U102KzeGewLZBHdNzzHIq+rtlobT8AyRzNBQu2bofRQU
         lW+94XsWy6hRT5WkrnasVjoMFxOwCXvvIQaYMWBiRfhudEP077EmVvIXTVnPGoYt1jlT
         qM06s66iafem4Bp851Z9ti3aTTNQ+7YsMv43DmmIyWbX04ZXr9nJfWTRnvGuRkXSE3X4
         TqDm9j7OXBtpbgobxdIsds+bnEtShk98KdDTZnG9ufnVwcdZPUpw+xURYLVM+hOGlPGR
         c8+FNHp1ZGpuEMdyhG0WuYE6NwIywu+PzcxRwGIyL3M4EtJZg0zdvDXt07GBp/JBImuO
         KR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088692; x=1792693492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4h1CjJh2Pd70gAZyF57+B40XRbkhki100Vx+kKXuXM=;
        b=GlY39FCnRqC+ROVJxAzqFaxj1Z6jtn2dHVPhrIakL79HUiJHxFCs2EwcLzB4pytilA
         d/AKqfXWWgsY3y9yeFISJNkIBtTGW454nXG1q3CQ1m/PLENvrI17Z8L1eZcvW01hXB/o
         PFdyrHM9IwyFpc/IphqslY+PttGIsv0EO0rs3qrvSgY+GkBHOxnuAwXjojLTSA3URbWi
         X7CFh7rzPeupm6Yi9TQV73SG+MG8LcHd4oNbEtn5zR/9GRen4ioiuFKqj0ACqZrBb7Nf
         hBWs0nOITcsVQOI2Tgl6c6/Q/AfGTE89XXm4tvz2mVZQrQX1Kl/zB3by2eKLZaDrS1iu
         4Lng==
X-Forwarded-Encrypted: i=1; AKwUvBxC3Zrx39pyUH+dYjqIz0R0gZ1w9hzhSb5BoTMZfrVM4CvjGIKN22v9WJnsEnscRtAl30p115vsSSs=@lists.infradead.org
X-Gm-Message-State: AFq9FYI+DzG4JTB42BtBwRme79+qYxS0VdbLXqh/GKUiIUkcJbD8w2ek
	Sxa5ktG+qWyE1Xxr97MnR+ieKL+MtQlG0drQtNsS/h6JVidbXI+qWBqmGNvQbre5Fzw=
X-Gm-Gg: AYBFou0CVj4PCtS7quBk8P3MA/Mc0HFTSFhMzfVJw1L/YMCf5rAn9rCH9l+GrZpyju4
	cldbKXH3BD4XR0DZx5bES2yW82q18LOKbrzbLFaGUvKavpM+t7wMXu2DxqSTLq3mc0ijQCmgPPr
	49e1z6NtZjV+m4HeKFQWJMKsLah1gNbkERplHRXotb8uLH8pneEwHLUHli+g0mzbOkSCXhFLSbf
	1R8TSYp9XLwWzJfazZ3Ur85EB/j3TD6WgN6JH8Ya53SsLJKwPtMVkZ1gsSe/jSkVMoAcdsjQAG0
	pd8G4Q+bHY22vmeAUntEmLAfLcjoVMbcTgnYdntcUpRvqRowIOhP7t5/wObx3ft6ubAmln71qqp
	PW8nPWsF6D+BWbH8pudYKOjTfkvN40ziZ3X1VJ2yozw59gALm5YhoxC7Ghwl7zpLl0XxWcqcxqy
	KStgH6JVjPfQB56/EcQDWyjiElzwk8OZ/421fcI3tt/TZn52et3XjHAYCe/Fi5yvEFdbho+Is32
	/NqS6F9IZmmHFFj3RAfrw==
X-Received: by 2002:a05:6808:2381:b0:4c3:9892:96fe with SMTP id 5614622812f47-50c40a39b1amr19538248b6e.3.1792088690116;
        Thu, 15 Oct 2026 11:24:50 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.59.77])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-537b7719719sm158052b6e.17.2026.10.15.11.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 11:24:49 -0700 (PDT)
Message-ID: <9254b516-425d-4fa4-b902-1ae38a45571b@sifive.com>
Date: Thu, 15 Oct 2026 13:24:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Davidlohr Bueso <dave@stgolabs.net>, Anup Patel <anup@brainfault.org>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org
References: <20260827211209.2871124-1-dave@stgolabs.net>
 <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
 <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
 <CAAhSdy371da4PnzHLsqS0WFso6PSUvgsVC+fg_wWFymqZPNREQ@mail.gmail.com>
 <20261015180656.dt53d3dtyvlssl5a@offworld>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261015180656.dt53d3dtyvlssl5a@offworld>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_192455_226221_D26B8BB0 
X-CRM114-Status: GOOD (  20.40  )
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

T24gMjAyNi0xMC0xNSAxOjA2IFBNLCBEYXZpZGxvaHIgQnVlc28gd3JvdGU6Cj4gT24gU2F0LCAx
MCBPY3QgMjAyNiwgQW51cCBQYXRlbCB3cm90ZToKPiAKPj4gSSB0aGluayBoYXZpbmcgc3RhdGlj
LWtleSBrdm1fcmlzY3Zfbm9feGVudmNmZyBpcyBtdWNoIGNsZWFuZXIKPj4gYmVjYXVzZSB3ZSBh
bHJlYWR5IGhhdmUga3ZtX3Jpc2N2X3Zzc3RhZ2VfdGxiX25vX2dwYSB3aGljaAo+PiBpcyBhbm90
aGVyIHdvcmstYXJvdW5kLiBUaGUga3ZtX3Jpc2N2X25vX3hlbnZjZmcgd2lsbCBiZSBkaWFibGVk
Cj4+IGJ5IGRlZmF1bHQgYW5kIHdpbGwgYmUgZW5hYmxlZCBvbmx5IGZvciBQNTAwIChFU1dJTiBF
SUM3NzAwWCkuCj4gCj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgSSBhZ3JlZSBpdCBsb29r
cyBjbGVhbmVyLgo+IEhvdyBhYm91dCB0aGUgYmVsb3cgKGZpeGVzIHRoaW5ncyBmb3IgbWUpPwo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBpbmRleCBhMzA2MDA1NzkyMzEuLjUxYjZk
MWY3NjYyNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtMzMxLDUgKzMz
MSw2IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKPiDCoAo+IMKgLyogRmxhZ3MgcmVwcmVzZW50aW5nIGltcGxlbWVudGF0aW9u
IHNwZWNpZmljIGRldGFpbHMgKi8KPiDCoERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShrdm1fcmlz
Y3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPiArREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGt2bV9y
aXNjdl9ub194ZW52Y2ZnKTsKPiDCoAo+IMKgI2VuZGlmIC8qIF9fUklTQ1ZfS1ZNX0hPU1RfSF9f
ICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3Zt
L21haW4uYwo+IGluZGV4IDg5NTY4Y2NjZTAxZC4uZGVjMzM4MzE5Y2I3IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+IEBA
IC0xNSwxMSArMTUsMTMgQEAKPiDCoCNpbmNsdWRlIDxhc20va3ZtX21tdS5oPgo+IMKgI2luY2x1
ZGUgPGFzbS9rdm1fbmFjbC5oPgo+IMKgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiArI2luY2x1ZGUg
PGFzbS92ZW5kb3JpZF9saXN0Lmg+Cj4gwqAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3ZlY3Rvci5o
Pgo+IMKgCj4gwqBzdGF0aWMgREVGSU5FX1BFUl9DUFUoYm9vbCwga3ZtX3Jpc2N2X3ZpcnR1YWxp
emF0aW9uX2VuYWJsZWQpOwo+IMKgCj4gwqBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShrdm1fcmlz
Y3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPiArREVGSU5FX1NUQVRJQ19LRVlfRkFMU0Uoa3ZtX3Jp
c2N2X25vX3hlbnZjZmcpOwo+IMKgCj4gwqBzdGF0aWMgdm9pZCBrdm1fcmlzY3Zfc2V0dXBfdmVu
ZG9yX2ZlYXR1cmVzKHZvaWQpCj4gwqB7Cj4gQEAgLTI5LDYgKzMxLDEzIEBAIHN0YXRpYyB2b2lk
IGt2bV9yaXNjdl9zZXR1cF92ZW5kb3JfZmVhdHVyZXModm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKg
IHN0YXRpY19icmFuY2hfZW5hYmxlKCZrdm1fcmlzY3ZfdnNzdGFnZV90bGJfbm9fZ3BhKTsKPiDC
oMKgwqDCoMKgwqDCoMKgIGt2bV9pbmZvKCJWUy1zdGFnZSBUTEIgZG9lcyBub3QgY2FjaGUgZ3Vl
c3QgcGh5c2ljYWwgYWRkcmVzcyBhbmQgVk1JRFxuIik7Cj4gwqDCoMKgwqAgfQo+ICsKPiArwqDC
oMKgIC8qIFNpRml2ZSBQNTUwIChFU1dJTiBFSUM3NzAwWCk6IEggb24gYSAxLjExIGJhc2UsIG5v
IGhlbnZjZmcvc2VudmNmZyAqLwo+ICvCoMKgwqAgaWYgKHJpc2N2X2NhY2hlZF9tdmVuZG9yaWQo
MCkgPT0gU0lGSVZFX1ZFTkRPUl9JRCAmJgo+ICvCoMKgwqDCoMKgwqDCoCAocmlzY3ZfY2FjaGVk
X21hcmNoaWQoMCkgJiAweEZGRkYpID09IDB4OCkgewoKVGhpcyBjaGVjayBpcyBub3Qgc3BlY2lm
aWMgZW5vdWdoIHRvIG1hdGNoIG9ubHkgdGhlIGFmZmVjdGVkIGltcGxlbWVudGF0aW9ucy4KWW91
IG5lZWQgdG8gbWF0Y2ggdGhlIHdob2xlIG1hcmNoaWQgdmFsdWUgKDB4ODAwMDAwMDAwMDAwMDAw
OCkuIE90aGVyd2lzZSB0aGlzCmxvb2tzIGdvb2QgdG8gbWUuCgpSZWdhcmRzLApTYW11ZWwKCj4g
K8KgwqDCoMKgwqDCoMKgIHN0YXRpY19icmFuY2hfZW5hYmxlKCZrdm1fcmlzY3Zfbm9feGVudmNm
Zyk7Cj4gK8KgwqDCoMKgwqDCoMKgIGt2bV9pbmZvKCJoZW52Y2ZnIGFuZCBzZW52Y2ZnIENTUnMg
bm90IGltcGxlbWVudGVkXG4iKTsKPiArwqDCoMKgIH0KPiDCoH0KPiDCoAo+IMKgbG9uZyBrdm1f
YXJjaF9kZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDdmMTYzNmM0NGQ0
MS4uZTVmODc3Mjg0MDI2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC03NzIsNyArNzcyLDggQEAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkCj4ga3ZtX3Jpc2N2X3ZjcHVfc3dhcF9pbl9ndWVzdF9zdGF0ZShz
dHJ1Y3Qga3ZtX3ZjcHUgKgo+IMKgwqDCoMKgIHN0cnVjdCBrdm1fdmNwdV9jc3IgKmNzciA9ICZ2
Y3B1LT5hcmNoLmd1ZXN0X2NzcjsKPiDCoAo+IMKgwqDCoMKgIHZjcHUtPmFyY2guaG9zdF9zY291
bnRlcmVuID0gY3NyX3N3YXAoQ1NSX1NDT1VOVEVSRU4sIGNzci0+c2NvdW50ZXJlbik7Cj4gLcKg
wqDCoCB2Y3B1LT5hcmNoLmhvc3Rfc2VudmNmZyA9IGNzcl9zd2FwKENTUl9TRU5WQ0ZHLCBjc3It
PnNlbnZjZmcpOwo+ICvCoMKgwqAgaWYgKCFzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZrdm1fcmlz
Y3Zfbm9feGVudmNmZykpCj4gK8KgwqDCoMKgwqDCoMKgIHZjcHUtPmFyY2guaG9zdF9zZW52Y2Zn
ID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcsIGNzci0+c2VudmNmZyk7Cj4gwqDCoMKgwqAgaWYgKHJp
c2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+IMKg
wqDCoMKgwqDCoMKgwqAgdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVuMCA9IGNzcl9zd2FwKENTUl9T
U1RBVEVFTjAsIHNtY3NyLT5zc3RhdGVlbjApOwo+IMKgwqDCoMKgIGlmIChyaXNjdl9oYXNfZXh0
ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfWklDRklTUykpCj4gQEAgLTc4Niw3ICs3ODcs
OCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQKPiBrdm1fcmlzY3ZfdmNwdV9zd2FwX2lu
X2hvc3Rfc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2Cj4gwqDCoMKgwqAgc3RydWN0IGt2bV92Y3B1
X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+IMKgCj4gwqDCoMKgwqAgY3NyLT5z
Y291bnRlcmVuID0gY3NyX3N3YXAoQ1NSX1NDT1VOVEVSRU4sIHZjcHUtPmFyY2guaG9zdF9zY291
bnRlcmVuKTsKPiAtwqDCoMKgIGNzci0+c2VudmNmZyA9IGNzcl9zd2FwKENTUl9TRU5WQ0ZHLCB2
Y3B1LT5hcmNoLmhvc3Rfc2VudmNmZyk7Cj4gK8KgwqDCoCBpZiAoIXN0YXRpY19icmFuY2hfdW5s
aWtlbHkoJmt2bV9yaXNjdl9ub194ZW52Y2ZnKSkKPiArwqDCoMKgwqDCoMKgwqAgY3NyLT5zZW52
Y2ZnID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcsIHZjcHUtPmFyY2guaG9zdF9zZW52Y2ZnKTsKPiDC
oMKgwqDCoCBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NN
U1RBVEVFTikpCj4gwqDCoMKgwqDCoMKgwqDCoCBzbWNzci0+c3N0YXRlZW4wID0gY3NyX3N3YXAo
Q1NSX1NTVEFURUVOMCwgdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVuMCk7Cj4gwqDCoMKgwqAgaWYg
KHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9aSUNGSVNTKSkKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfY29uZmlnLmMKPiBpbmRleCBiNjhhYTgzMGFhZjUuLjliOGU0ZjFmMTJmNCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2NvbmZpZy5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9jb25maWcuYwo+IEBAIC04Miw5ICs4MiwxMSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1
X2NvbmZpZ19sb2FkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiDCoMKgwqDCoMKgwqDCoMKgIG5z
aCA9IG5hY2xfc2htZW0oKTsKPiDCoMKgwqDCoMKgwqDCoMKgIG5hY2xfY3NyX3dyaXRlKG5zaCwg
Q1NSX0hFREVMRUcsIGNmZy0+aGVkZWxlZyk7Cj4gwqDCoMKgwqDCoMKgwqDCoCBuYWNsX2Nzcl93
cml0ZShuc2gsIENTUl9ISURFTEVHLCBjZmctPmhpZGVsZWcpOwo+IC3CoMKgwqDCoMKgwqDCoCBu
YWNsX2Nzcl93cml0ZShuc2gsIENTUl9IRU5WQ0ZHLCBjZmctPmhlbnZjZmcpOwo+IC3CoMKgwqDC
oMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5hY2xfY3NyX3dyaXRlKG5zaCwgQ1NSX0hFTlZDRkdILCBjZmctPmhlbnZjZmcgPj4g
MzIpOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXN0YXRpY19icmFuY2hfdW5saWtlbHkoJmt2bV9y
aXNjdl9ub194ZW52Y2ZnKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hY2xfY3NyX3dy
aXRlKG5zaCwgQ1NSX0hFTlZDRkcsIGNmZy0+aGVudmNmZyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG5hY2xfY3NyX3dyaXRlKG5zaCwgQ1NSX0hFTlZDRkdILCBjZmctPmhlbnZj
ZmcgPj4gMzIpOwo+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAocmlz
Y3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikpIHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFjbF9jc3Jfd3JpdGUobnNoLCBDU1JfSFNUQVRFRU4w
LCBjZmctPmhzdGF0ZWVuMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkFC
TEVEKENPTkZJR18zMkJJVCkpCj4gQEAgLTkzLDkgKzk1LDExIEBAIHZvaWQga3ZtX3Jpc2N2X3Zj
cHVfY29uZmlnX2xvYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+IMKgwqDCoMKgIH0gZWxzZSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX0hFREVMRUcsIGNmZy0+aGVkZWxlZyk7
Cj4gwqDCoMKgwqDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX0hJREVMRUcsIGNmZy0+aGlkZWxlZyk7
Cj4gLcKgwqDCoMKgwqDCoMKgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgY2ZnLT5oZW52Y2ZnKTsK
PiAtwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX0hFTlZDRkdILCBjZmctPmhlbnZjZmcgPj4g
MzIpOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXN0YXRpY19icmFuY2hfdW5saWtlbHkoJmt2bV9y
aXNjdl9ub194ZW52Y2ZnKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNzcl93cml0ZShD
U1JfSEVOVkNGRywgY2ZnLT5oZW52Y2ZnKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
SVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY3NyX3dyaXRlKENTUl9IRU5WQ0ZHSCwgY2ZnLT5oZW52Y2ZnID4+IDMyKTsKPiArwqDCoMKg
wqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5s
aWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNzcl93cml0ZShDU1JfSFNUQVRFRU4wLCBjZmctPmhzdGF0ZWVuMCk7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
