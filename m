Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2548EFF885A
	for <kvm-riscv@archiver.kernel.org>; Tue,  5 May 2026 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyB283ojbh1fzUOugKnaIBRXCn11wP5zMcjMejjimiY=; b=z3QSJRDV0xfIdv
	iceBLH9Q0t80/+VFFpP+cVelA4wLIWDrekJEI2LMhSAEn/9xqLzHkE0vKITafbGQi+S/uiHhvZRLL
	9aMcvywbM8CbQhGc+FTApi7RXjTLnq4Clca5lyBl9eZdc3oe+JmvF3eiPBtm+sZs0f/+7RJul1EfQ
	HXWwndbgIfWQlQCGRyicd5049Em3US1qnHrNHWnC1DVAPA4PqsXWuULB3TDOKiiZKZKGFLmSlE/fI
	o0X/zkGCIHq3HEAyucu57QNdgQ50zhYurpnDEXt9wK2yatKgjAIGp38bzdd+nrd+5IFzEuoB+b2Zd
	pwCOoXIHwm18oqxy+nTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG95-0000000GO0v-2N1V;
	Tue, 05 May 2026 13:49:07 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKG91-0000000GNtK-3nfQ;
	Tue, 05 May 2026 13:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777988932; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=AIhBTePeyajf+I+K0EBW6V9IUyGlhUFNxPuEI2KpBN0=;
	b=m896v1mJEk8/j2LWIVsUwz12FOvggOwNkr5XtRfp+8ydO7RaiTg9ESXbEZXaIjlVxn2Jtu2vZ3GDmchMjdkmK8Hi5sVYH/OXT1ETuxl2443BThWf4LZ3pd3AJKozKyKzES0ruPISH6xrtY1+gtRYkB8gWxuwViSE67FMC4J0/q4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R571e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X2I-OJb_1777988923;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2I-OJb_1777988923 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 05 May 2026 21:48:45 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 00/11] iommu/riscv: Add hardware dirty tracking for second-stage domains 
Date: Tue,  5 May 2026 21:48:42 +0800
Message-Id: <20260505134842.23549-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <tdcd7276ffsfc6vh3expyfcajnfkowknbtkpyplb3xe3dcukj2@tnhi6jcwrfgn>
References: <tdcd7276ffsfc6vh3expyfcajnfkowknbtkpyplb3xe3dcukj2@tnhi6jcwrfgn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_064904_643218_B36E197C 
X-CRM114-Status: GOOD (  12.25  )
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

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+IAo+PiBU
aGUgUklTQy1WIElPTU1VIGFyY2hpdGVjdHVyZSBkZWZpbmVzIGFuIEFNT19IV0FEIGNhcGFiaWxp
dHkgKEhhcmR3YXJlCj4+IEFjY2Vzcy9EaXJ0eSB1cGRhdGUpIHRoYXQgYWxsb3dzIHRoZSBJT01N
VSB0byBhdG9taWNhbGx5IHNldCB0aGUgQS9EIGJpdHMKPj4gaW4gc2Vjb25kLXN0YWdlIFBURXMg
b24gRE1BIGFjY2Vzcy4gIFdoZW4gREMudGMuR0FERSBpcyBhc3NlcnRlZCwgdGhlIElPTU1VCj4+
IGF1dG9ub21vdXNseSBzZXRzIEQgb24gdGhlIGZpcnN0IHdyaXRlIHRvIGEgcGFnZSBtYXBwZWQg
YnkgYW4gaW9oZ2F0cAo+PiBkb21haW4uICBUaGlzIHNlcmllcyB3aXJlcyB0aGF0IGNhcGFiaWxp
dHkgdXAgdG8gdGhlIGlvbW11ZmQgZGlydHktdHJhY2tpbmcKPj4gaW50ZXJmYWNlIChJT01NVV9I
V1BUX1NFVF9ESVJUWV9UUkFDS0lORyAvIElPTU1VX0hXUFRfR0VUX0RJUlRZX0JJVE1BUCkgYW5k
Cj4+IHJlcG9ydHMgSU9NTVVfQ0FQX0RJUlRZX1RSQUNLSU5HLgo+PiAKPj4gRGVzaWduIG5vdGVz
Cj4+IC0tLS0tLS0tLS0tLQo+PiAKPj4gKiBUaGUgZmVhdHVyZSBpcyBzY29wZWQgdG8gc2Vjb25k
LXN0YWdlIChpb2hnYXRwKSBkb21haW5zIG9ubHk7IHRoZXNlIGFyZQo+PiAgIHRoZSBkb21haW5z
IGNyZWF0ZWQgZm9yIEtWTSAvIFZGSU8gZGV2aWNlIHBhc3MtdGhyb3VnaCB3aGVuIHVzZXJzcGFj
ZQo+PiAgIGFsbG9jYXRlcyBhbiBIV1BUIHdpdGggSU9NTVVfSFdQVF9BTExPQ19ORVNUX1BBUkVO
VCBvcgo+PiAgIElPTU1VX0hXUFRfQUxMT0NfRElSVFlfVFJBQ0tJTkcuICBGaXJzdC1zdGFnZSAo
aW9zYXRwKSBkb21haW5zIGFyZSBub3QKPj4gICB0b3VjaGVkIGJ5IHRoaXMgc2VyaWVzLgo+PiAK
Pj4gKiBUaGUgcGFnZS10YWJsZSBzaWRlIHBsdWdzIGludG8gdGhlIGV4aXN0aW5nIGdlbmVyaWNf
cHQgZGlydHkgaG9vawo+PiAgIGZyYW1ld29yayAoYW1kdjEgLyB2dGRzcyBzdHlsZSkuICBSSVND
LVYgYWRkcyB0aGUgdGhyZWUgcmVxdWlyZWQgUFRFCj4+ICAgb3BzIOKAkyBpc193cml0ZV9kaXJ0
eSAvIG1ha2Vfd3JpdGVfY2xlYW4gLyBtYWtlX3dyaXRlX2RpcnR5Lgo+PiAKPj4gVGVzdGluZwo+
PiAtLS0tLS0tCj4+IAo+PiAqIFRlc3Qgb24gUUVNVSBSSVNDLVYsIGEgdmlydGlvLW5ldCBhbmQg
YW4gZTEwMDBlIGRldmljZSB3YXMgcGFzc2VkIHRocm91Z2gKPj4gICB0byBhbiBMMiBndWVzdCB2
aWEgdmZpby1wY2kgKyBpb21tdWZkLgo+PiAKPj4gKiBnZW5lcmljX3B0IEtVbml0OiB0aGUgZXhp
c3RpbmcgdGVzdF9kaXJ0eSBjYXNlIG5vdyBydW5zIGFuZCBwYXNzZXMgZm9yCj4+ICAgdGhlIFJJ
U0MtViA2NC1iaXQgZm9ybWF0Lgo+PiAKPj4gRm9sbG93LXVwIHdvcmsKPj4gLS0tLS0tLS0tLS0t
LS0KPj4gKiBCdWlsZCBhIGRlZGljYXRlZCBlbmQtdG8tZW5kIHRlc3QgY2FzZSB0aGF0IGRyaXZl
cyB0aGUgZnVsbCBmbG93Cj4+ICAgKEhXUFRfQUxMT0Mgd2l0aCBESVJUWV9UUkFDS0lORyAtPiBh
dHRhY2ggLT4gSU9BU19NQVAgLT4gZ2VuZXJhdGUgcmVhbAo+PiAgIERNQSAtPiBTRVRfRElSVFlf
VFJBQ0tJTkcgLT4gR0VUX0RJUlRZX0JJVE1BUCAtPiB2ZXJpZnkgYml0bWFwIGFnYWluc3QKPj4g
ICBleHBlY3RlZCBJT1ZBIGZvb3RwcmludCkgc28gdGhhdCB0aGUgYmVoYXZpb3VyIGNhbiBiZSBy
ZWdyZXNzaW9uLXRlc3RlZAo+PiAgIGJleW9uZCB0aGUgS1VuaXQgUFRFLWxldmVsIGNvdmVyYWdl
Lgo+PiAKPj4gKiBJZiBwb3NzaWJsZSwgcmViYXNlIGFuZCByZXRlc3Qgb24gdG9wIG9mIHRoZSB1
cGRhdGVkICJpb21tdSBpcnFieXBhc3MiCj4+ICAgcGF0Y2hzZXQuCj4KPlRoYW5rcyBmb3IgdGhp
cyBzZXJpZXMhIEkgd2FzIHN0YXJ0aW5nIHRvIGdvIGRvd24gYSBzaW1pbGFyIHJvYWQgbXlzZWxm
Cj5pbiBvcmRlciB0byBsaW1pdCBpcnFieXBhc3MgdG8gSU9NTVVfSFdQVF9BTExPQ19ORVNUX1BB
UkVOVCBkb21haW5zIHNpbmNlCj5JIHdhc24ndCBoYXBweSB3aXRoIG90aGVyIGFwcHJvYWNoZXMs
IGUuZy4gY29udGludWluZyB0byB1c2Ugcy1zdGFnZSwgYnV0Cj5hY3RpdmF0aW5nIGctc3RhZ2Ug
dG9vIHdpdGggaWRlbnRpdHkgbWFwcGluZ3Mgc2luY2UgdGhlIE1TSSB0YWJsZSBjYW4ndCBiZQo+
YWN0aXZhdGVkIG90aGVyd2lzZS4gT3IsIHNpbXBseSB1c2luZyBnLXN0YWdlIGluc3RlYWQgb2Yg
cy1zdGFnZSBpbiBvcmRlcgo+dG8gZ2V0IHRoZSBNU0kgdGFibGUgZW5hYmxlZC4gSW4gdGhlIGVu
ZCwgSSB0aGluayB0aGUgYmVzdCBpcyB0byByZXF1aXJlCj5uZXN0ZWQgZm9yIGlycWJ5cGFzcyBh
bmQgdGhpcyBzZXJpZXMgd2lsbCBwcm92aWRlIGEgZ29vZCBiYXNlIGZvciB0aGF0Lgo+Cj5JJ2xs
IHJlYmFzZSBpcnFieXBhc3Mgb24gdGhpcyBzZXJpZXMgYW5kIHRlc3QgaXQgb3V0Lgo+CgpUaGFu
a3MgZm9yIHRoZSBmZWVkYmFjay4gSmFzb24gaGFzIHByb3ZpZGVkIHNvbWUgaGVscGZ1bCBzdWdn
ZXN0aW9ucyBvbiB0aGlzCnNlcmllcywgYW5kIEkgYW0gaW4gdGhlIHByb2Nlc3Mgb2YgdXBkYXRp
bmcgaXQuIEkgZXhwZWN0IHRvIHNlbmQgb3V0IGEgbmV3CnZlcnNpb24gaW4gdGhlIGNvbWluZyBk
YXlzLgoKRmFuZ3l1Cgo+VGhhbmtzLAo+ZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
