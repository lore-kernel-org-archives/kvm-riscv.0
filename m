Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE168C4451B
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzEbG8xKiLO/DkW+sCyClTgUPp9YCAxyRb94A7Xr0eE=; b=dkKUsT4aFh6G0x
	uDdW4osMs5lTKFzubrV6ogUlys12AcqvReUpmheVbvJoZ7iv2mTdvuGsBYI545Nzvb8nT8J6BJwFV
	PRn8ADWQbozaXyizI6db8YIUVJDfbWX5kKphtZP6y3dVBo+As2w2gdItgbTVDB4QbqSS+dZv8I8yo
	2ub9Ye21NVMDjiivQfIGcvPO4mFmOXOcbkG9SKS6GcXaD1PRKcf2IE1eH85VjlSjMWcJ0F1E3e6dU
	9G3a8Mb7DoWtr7DXd+o+HiM5+Ufuhh9wOxUoCY/e0Bv8m8GxXL+iRFoacGgz42PpBXgjt7wipGskv
	HjL6toNvBmGy8IATJPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknGq-000000031Bc-1sLG;
	Fri, 17 Jul 2026 18:26:48 +0000
Received: from lamorak.hansenpartnership.com ([2604:f440:8:8::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknGn-000000031Av-46Qu
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 18:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1784312803;
	bh=j9EW4FIwSUEDfQEZzduIwipOWgGQyApHfWxvJ08O9xk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=H5D2LU12iBOHilk/nOzeUp4ZvKBs+i7bbfPhCzAA721rNfph60WER/+r4o7ApVPjk
	 wn9U4Sko57CiVWMYgrkUEqUQQf5XAbU95LhUdz6jMPiMc04p0wX4T/xVxhNPirMzjz
	 jGgvP8X9Myk6XD3stu/upYGy99g06ADfkdYj6fgM=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8c71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 186CA1C0276;
	Fri, 17 Jul 2026 14:26:43 -0400 (EDT)
Message-ID: <1f06c5c65fcf00d45ce93c97e1434f70626997fa.camel@HansenPartnership.com>
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Saenz Julienne, Nicolas" <nsaenz@amazon.es>, 
 =?ISO-8859-1?Q?J=F6rg_R=F6del?=
	 <joro@8bytes.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky	
 <thomas.lendacky@amd.com>, "ashish.kalra@amd.com" <ashish.kalra@amd.com>, 
 "michael.roth@amd.com"	 <michael.roth@amd.com>, "Orazgaliyeva, Anel"
 <anelkz@amazon.de>, Melody Wang	 <huibo.wang@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "kvmarm@lists.linux.dev"	 <kvmarm@lists.linux.dev>,
 "loongarch@lists.linux.dev"	 <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org"	 <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org"	 <linuxppc-dev@lists.ozlabs.org>,
 "kvm-riscv@lists.infradead.org"	 <kvm-riscv@lists.infradead.org>,
 "x86@kernel.org" <x86@kernel.org>,  "coconut-svsm@lists.linux.dev"	
 <coconut-svsm@lists.linux.dev>, "joerg.roedel@amd.com"
 <joerg.roedel@amd.com>
Date: Fri, 17 Jul 2026 14:26:42 -0400
In-Reply-To: <DK10YP78VVQO.7BFETGMA9P4F@amazon.com>
References: <20260608144252.351443-1-joro@8bytes.org>
	 <20260608144252.351443-36-joro@8bytes.org>
	 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
	 <aib8n5lO6HKbLC4Y@8bytes.org>
	 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
	 <aigE2EvJyZlYDz0V@8bytes.org> <DK0W6G329B6W.2KGT7FAVSKNYS@amazon.com>
	 <976f1a8316438d5b7c2f446a0369dcda3289cc92.camel@HansenPartnership.com>
	 <DK10YP78VVQO.7BFETGMA9P4F@amazon.com>
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 keydata=mQENBE58FlABCADPM714lRLxGmba4JFjkocqpj1/6/Cx+IXezcS22azZetzCXDpm2MfNE
 lecY3qkFjfnoffQiw5rrOO0/oRSATOh8+2fmJ6el7naRbDuh+i8lVESfdlkoqX57H5R8h/UTIp6gn
 1mpNlxjQv6QSZbl551zQ1nmkSVRbA5TbEp4br5GZeJ58esmYDCBwxuFTsSsdzbOBNthLcudWpJZHU
 RfMc0ew24By1nldL9F37AktNcCipKpC2U0NtGlJjYPNSVXrCd1izxKmO7te7BLP+7B4DNj1VRnaf8
 X9+VIApCi/l4Kdx+ZR3aLTqSuNsIMmXUJ3T8JRl+ag7kby/KBp+0OpotABEBAAG0N0phbWVzIEJvd
 HRvbWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT6JAVgEEwEIAEICGw
 MGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAml2ZBI
 FCS3GUMIACgkQgUrkfCFIVNZKjQf/deRzlXZClKxTC/Ee2yEPqqS7mm/INUA49KdQQ5oIhSxkUBy0
 9J4qjMIo5F8ZFkFTqikBqeL35LKu7O7rn8WETfX8Bxvos3HUsl3jHo34DES4MUFIpoQPgtiLRGwLb
 K0cVCAArR2u2qj4ABmTRrs1I1kvdjEw6gatOuXtEe/j5O2fvfzTq9GBr0Q3n2IAsFXi4hLlx6VPE8
 tyWUZ8BWJKtih3JAeUiXFvASL3McV0rV9RnU0VbjEQEhSE7PMYhWpnDC9AyBb0lXJllQRvC3NSkUB
 8KVQgNNxRPss0WE/nBoZ4dFA42jTyzTz8lNylxZoAWV7WJb3QxVg4oCodRVrxxrQhSmFtZXMgQm90
 dG9tbGV5IDxqZWpiQGtlcm5lbC5vcmc+iQFVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeA
 QIXgBYhBNVgbnPItGJxvq2a34FK5HwhSFTWBQJgS5mYBQkbNYS9AAoJEIFK5HwhSFTWBpwIAL5Bk3
 5FB34U6iHmDzzgdCbxLTs43T/YQyJpcGIvopBvnI/fDY8oSG6Df64/O6B+1R+A8TDp6ZG5ysUWnCC
 6GuIaEHemBYkitMPglR6+sGCMQY7O0mlsPvdssvKK1KI9Bno4VU6ogaF2qVzefSqg1Djmf/DcsxWP
 rI/jdJ8FB5AYR2rjIdDFc+zRdAJuavo1/anyY2wgpFh/3R8IOYAEfWV9nGgYkf9+tA4EIn1sxE0I3
 L5oW2N3mbyRrkzuBwO8ztMCwqEPk7moWzhokcZqMXiAIahaZdkashJC+s2X2RZSGCy+g+pvY5NN4B
 BVG5XwLgVBqbHMTcxE0fbmPqz+q6O0LEphbWVzIEJvdHRvbWxleSA8amVqYkBoYW5zZW5wYXJ0bmV
 yc2hpcC5jb20+iQFXBBMBCABBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAmODZ5ACGwMFCRs1hL0F
 CwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQgUrkfCFIVNZu0Af/TzvL2/NdgAcw9uN3x60H8
 jc4QUq14VpxcFEFEMpcj1morkX/G93V+56HBBaXZj+yK8PhxIA/SIz+sU7C/0YvKuvzakP8ZX/7WJ
 e32SOUtjfr/VTaqjIBzNj6OxLvZpmNbBw7s6DwhhNpHOWqJ/1ml+PtDRDV71IB58yVqQjp1xlNKVl
 ZppcJ5908EJzsFnRIVjiQiDSKoppqB2BCibBbrWcln7CiWMyOC/cco6SIn6twH+f7+aivJ3xGcOE2
 a9gBKF5rNi9TBoX9oyPmshv/TDmnohsVrH7AYXlGYfZTk15SWEiROh1QX8/uD9wl/gcIv5EDUpT/F
 L2jzOsA5663bw==
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_112646_549525_53DF7AA8 
X-CRM114-Status: GOOD (  21.06  )
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDE3OjMzICswMDAwLCBTYWVueiBKdWxpZW5uZSwgTmljb2xh
cyB3cm90ZToKPiBPbiBGcmkgSnVsIDE3LCAyMDI2IGF0IDU6NTYgUE0gQ0VTVCwgSmFtZXMgQm90
dG9tbGV5IHdyb3RlOgpbLi4uXQo+ID4gSG93ZXZlciwgZnJvbSBhIHF1aWNrIHNraW0sIHRoZSBt
YWluIHRoaW5nIGlzIHRoYXQgeW91IHVzZWQKPiA+IG11bHRpcGxlIEtWTSBzdHJ1Y3R1cmVzIHRv
IG1hbmFnZSB0aGUgcGxhbmVzIHdoaWNoIG1lYW5zIGVhY2ggcGxhbmUKPiA+IG5hdHVyYWxseSBn
ZXRzIGl0cyBvd24gYWRkcmVzcyBzcGFjZS7CoCBJbiB0aGUgY3VycmVudCBwbGFuZXMgbW9kZWwK
PiA+IHNvIGZhciB0aGVyZSdzIG9ubHkgb25lIGFkZHJlc3Mgc3BhY2UgKG9yIHR3byBpZiB5b3Ug
aGF2ZSBTTU0pLsKgCj4gPiBTTlAgZG9lc24ndCBuZWVkIGFueXRoaW5nIGFib3ZlIHRoaXMgYmVj
YXVzZSB0aGUgVk1QTCBwcm90ZWN0aW9uIGlzCj4gPiBuYXR1cmFsbHkgbWFuYWdlZCBpbnNpZGUg
dGhlIGd1ZXN0IChzbyBub3QgcmVhbGx5IHZpc2libGUgdG8gdGhlCj4gPiBob3N0KSBidXQgYSBW
VEwgaW1wbGVtZW50YXRpb24gd2lsbC7CoCBTbyBJIHRoaW5rIHRoZSBiaWcgcXVlc3Rpb24KPiA+
IGJlY29tZXMgaG93IGFyZSB3ZSBnb2luZyB0byBhY2hpZXZlIGFkZHJlc3Mgc3BhY2Ugc2VwYXJh
dGlvbiBmb3IKPiA+IHBsYW5lcz/CoCBJdCdzIHRlbXB0aW5nIHRvIHNheSBzaW1wbHkgb25lIGFk
ZHJlc3Mgc3BhY2UgcGVyIHBsYW5lCj4gPiBhbmQgbWFrZSBTTU0gaXRzIG93biBwbGFuZSB3aXRo
IGRpZmZlcmVudCBzd2l0Y2hpbmcgYnV0IGl0J3MgYW4KPiA+IGF3ZnVsIGxvdCBvZiBvdmVyaGVh
ZCBlc3BlY2lhbGx5IGFzIG1vc3QgVk1zIHdvbid0IGV2ZW4gdXNlIHBsYW5lcywKPiA+IHNvIGl0
IGxvb2tzIGxpa2UgdGhlcmUgaGFzIHRvIGJlIGEgbW9yZSBvcHBvcnR1bmlzdGljIG1vZGVsIGZv
cgo+ID4gcGxhbmVzIGFkZHJlc3Mgc3BhY2VzLgo+IAo+IFdoaWxlIGFkcmVzcyBzcGFjZXMgYXJl
IHBlciBWTSwgS1ZNIG1lbW9yeSBhdHRyaWJ1dGVzIGFyZSBwZXIgcGxhbmUuCj4gSXQgc2hvdWxk
IGJlIGVub3VnaCB0byBpbXBsZW1lbnQgVlNNJ3MgbWVtb3J5IHByb3RlY3Rpb25zIGFzIHdlbGwg
YXMKPiB0aGUgZW5jbGF2ZXMgZGVzaWduIHlvdSBtZW50aW9uZWQuIFdlIGhhdmUgYSBzZXJpZXMg
aW4tZmx1eAo+IGltcGxlbWVudGluZyBSV1ggbWVtb3J5IGF0dHJpYnV0ZXMgWzFdLgoKV2UgbWln
aHQgZ2V0IHRoaXMgdG8gd29yayBpZiB3ZSdyZSBjYXJlZnVsLiAgSXQganVzdCBtZWFucyB3aGVu
IHR3bwpwbGFuZXMgYWdyZWUgb24gY2h1bmtzIG9mIG1lbW9yeSB0byBzZWFsIGFuZCBzaGFyZSBp
dCdzIGhlbHBmdWwgaWYKdGhleSdyZSBndWVzdCBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMuCgo+IFRo
ZSBvbmx5IHRoaW5nIHRoYXQncyBub3QgZmVhc2libGUgIm5hdHVyYWxseSIgd2l0aCBhdHRyaWJ1
dGVzIGFyZQo+IG1lbW9yeSBvdmVybGF5cyBvciBhbnkgc2l0dWF0aW9uIHdoZXJlIHdlJ2QgbmVl
ZCB0byBjaGFuZ2UgdGhlCj4gYmFja2luZyBtZW1vcnkgb2YgYSBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzIHJhbmdlIGp1c3QgZm9yIGEgc2luZ2xlCj4gcGxhbmUuIEZyb20gYSBWU00gcGVyc3BlY3Rp
dmUgaXQncyBmaW5lLiBUaGUgb25seSB1c2UtY2FzZSBmcm9tIGEgVlNNCj4gcGVyc3BlY3RpdmUg
YXJlIG1lbW9yeSBvdmVybGF5cyAoYW5kIHRob3NlLCBmcm9tIG15IGV4cGVyaWVuY2UsIGFyZQo+
IHVzZWxlc3MpLiBJIGRvbid0IGtub3cgdGhhdCdzIGEgZGVhbC1icmVha2VyIHRoZSBtdXR1YWxs
eSBkaXN0cnVzdGluZwo+IG1vZGVsLgoKSSBkb24ndCB0aGluayBzby4gIEkgZG9uJ3Qgc2VlIGl0
IGFzIGEgcHJvYmxlbSB0aGF0IHRoZSBndWVzdCBwaHlzaWNhbAptZW1vcnkgbWFwIGxvb2tzIHRo
ZSBzYW1lIHRvIGV2ZXJ5IHBsYW5lIGV2ZW4gaWYgdGhlIHBhZ2UgcHJvdGVjdGlvbnMKbWlnaHQg
YmUgZGlmZmVyZW50LiAgVGhpcyBpcyBzbGlnaHRseSBkaWZmZXJlbnQgZnJvbSBTTU0gd2hlcmUg
dGhlIHNtbQptZW1ibG9jayBpcyBtaXNzaW5nIGZyb20gdGhlIGd1ZXN0IG1hcCwgc28gaXQgbWln
aHQgYmUgdGhlIGNhc2UgdGhhdCB3ZQpkb24ndCBuZWVkIGRpZmZlcmVudCBhZGRyZXNzIHNwYWNl
cyB0byBjb3BlIHdpdGggdGhpcy4KClJlZ2FyZHMsCgpKYW1lcwoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
