Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE8CF01832
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGYb9xXP4R+Huz4hKqkXw1cn6VcQZN4WJGbITxg/oiM=; b=jjlJ7Q/Y6YPk5D
	gxJSfBqaDZvyqa1+3jlVZTXQ0KmKvxsqSBN9iNCEpxSNIRMmFIurmGCtOtytcHgxXBdtaIAvX6TX4
	5fqJnV0BKWdOHuR6gTYp4bsZwXgHto3eYW4gVkD51lpGJ8MbdHw2ZDnUlCtYM57kG14BrFZ/eTUY8
	P+LCICAPg/8K1NwwQWPWSAbthsfqfYdy2KHuii63GY7pui+cFw2N3Iy2spB9XuGOhmRXTZrBChcl0
	IhzG0WHf2mgR5Ufst3XLhZZ62qHlVyblBWNjSTwi8GzNt7dsmxa+UyiltXGtUOC3DHNhr45mpgyKL
	2Gp9un0sBJlg/N6itlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUaz-00000003g9E-0Za1;
	Fri, 06 Mar 2026 12:47:57 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUaw-00000003g8V-2yl7
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 12:47:56 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64aedd812baso8144504d50.3
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 04:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772801273; cv=none;
        d=google.com; s=arc-20240605;
        b=JU2rooL1LPlCWvS/3jaMCBPYr0OAxGwHTXc+S2D8eiLNIi2ous2YKL8Wu7aLgtudFE
         bzcactCJn4W4CtQcfyINoasAJDwLX6y8hww/SKeNqhjGC2bRig6rWn9fem1R0zhoMItn
         Z2qpEoNvJpMNGS6JQ6+pt1apBSsQd5uHwijmpxWVOcuV28dwoKaxdPr0YHvAkvP+91oa
         ngts2VOz85Bd9oz9W6H7sjBm5J5W1/z7zq5tUIHMduCv40IxfLdKz6IGvetmachHdceH
         9OZQjTcI2H1N5INadqtXBbnJlHq+7Ko4M2uguwpcPKfY6S5CYYC6Jbf3n9LbdAzCGH55
         Jqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZoBEJ7tkkeq/IYAC/TzZaRt6GXvGlu3YZe/iwn07mtE=;
        fh=1Gi5A+GwS+cVmZ2es4JicA7p+uX58KT+IT/eZ3JVtuo=;
        b=TMXAj7NJx1imLBbhxyOnrNp/6nPL1TvFofCSVgWuzAyo6TBlshtPVZa541aCNH94ND
         wGHXcj/+c1opHqHGUVZc/Um/mOxAMqeKLKl6f8XWi/E2oFVya7qn0d/B1OJt/orFJ1mE
         4K5RkaPD3/VT1oWL/iA4jmCU+XV6c09L73qd1pz2x9xeirkM2L6RMk8hhtSycKwKIftd
         D5pclM1NLNJqetslVCIoK9DH4BIfHemVbOuvM7hpDPgoeCdXDXFS8Gg0YB0M7gM+CEFY
         kDBreqgL39Xezx3KjanlG/tiFcCpBiNZJl5VfB3PE2KRA8q3aEph2FNOnicRv0nE/+3J
         I8hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1772801273; x=1773406073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoBEJ7tkkeq/IYAC/TzZaRt6GXvGlu3YZe/iwn07mtE=;
        b=1JFE5HZxV3jZSOSDtXR0+d/n4VwtRDiOwSQQHAjfAJPka8kLWNGJqTWLDbhM4Z/BUw
         tRbLXPqKRyDvlWU1jJAE5ymOMojdYJvz3wgbLMGM9GtL+F5Tk1vMjCSl2AN9yO7ZvAyC
         2Cv57STXcGyW3MZhFwhlXPJGL6qvQLApYiIs1fVPLrPt0iKjKE3OOrBEW7QuaP9wfU/L
         pGC2zumhGE0jSLEocsd6tCVTJi7K8430MIZRRsdHRXsucPhhv7jx3d5bpFZZ/FTbZoDT
         2Nv81AAB1C3/JqGZuVFioFy9+L3HjegziG9bFDEMa6ig/pxMmWUNY+pWGyTGL2t6NAG+
         7AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801273; x=1773406073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoBEJ7tkkeq/IYAC/TzZaRt6GXvGlu3YZe/iwn07mtE=;
        b=WfmEKNyUQRFQTxyzzALx6EJH2nd7ZEvX0FxcfKYdUiIwQOr9UO6BDE2l6xriq7jUNF
         cEr630RXELDjJUxRbNSotwVxTD6MNsmd/CSLpJvZurZfrfzhn/8f0Qa63zKEYV+0H6wj
         lZBQrKHAfF95dlzPRK+i6h3aLUS6kedUaI1V5dup8QQY0tRh9rVaf9bmtVPWWGk88dD+
         5JwXEg6qgcWPkcb1NhNvDaAPnz5qBHeiw8Duan3a4VUznVoNmpgxOv5W06NwDmZGVJfG
         Qse+KIqr0nbDjWVlaPICvwt0sulpKgDn6ldpxVMDHQxpmwEgr+0SxaPWCkbD9tkkM9MW
         poQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRuiCPiHZdUm9Eh1UNw9seQ+i1WT4gIkLsIH31x+zUZRSyxvFh+F/tM7nhCASTnidxT95z/utUb0A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXq1zBQEPVcru0KBnnoYzVucAJCe4VLHWq6ItkYysMMKJPyvIV
	+Zgxtw1nTTOn4U+/t+wflmNqoojMl89pwgtZMsIC0ocr68/WalRwToPI1f6X2KkoBGgenkvcxs6
	0bVwNdKxMG6uixtrjMUtCuvudXCTJOHWYWbdMbZo9wQ==
X-Gm-Gg: ATEYQzyMnMtLymngQG9KE5Q/qgIUSoU8VTCUHBnoYNxzUGEUdVKTQ7rtSrf45K47dDd
	MJR/ZiiIHN94DtG8Ppl58Hirih5tz6qfrFsuSdBUrE9Doz0TtHSRE92+ZngRkch6uPA/xlIy/pR
	Qv5+O2BUg6Xnl8l4zgAtnBJ7njib3Yyz/FA09nG0hfAR90BK8Vg9T/ApMq5FZRZ3ZXssYT7y7/c
	pHPapXFsetqUYCJ+KjOgnRGF3mbAgE04tIajo/LjoQozz6gfKeDbtxNo+WwA6jX+QsRGiSR2mF/
	z9/8e3zbRG/O6B1okkyumTJ6gvLcAboCVhVMdOfWrv7xS8oxPLKUVfy5
X-Received: by 2002:a05:690e:e27:b0:644:6f3c:11f3 with SMTP id
 956f58d0204a3-64d14166306mr1423697d50.27.1772801273353; Fri, 06 Mar 2026
 04:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-11-andrew.jones@oss.qualcomm.com> <CAH1PCMaAiQC1+zqPeRQAFDQz6QG8DzV4FpYGhjPh1ymko_7TMg@mail.gmail.com>
 <tkdt3jh6rghrkiiwntap2f6vmesh7bve23lfpkt5mufux2cjw6@yfwqu7ba2mnm>
In-Reply-To: <tkdt3jh6rghrkiiwntap2f6vmesh7bve23lfpkt5mufux2cjw6@yfwqu7ba2mnm>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 6 Mar 2026 20:47:42 +0800
X-Gm-Features: AaiRm52vR-ew6g12xjiqG2c5yLPepgtpowQBDchLgrx1Ddp_6ubgTEwTrdOXM9g
Message-ID: <CAH1PCMYgswKMwBzxhqL_5Ek49KC36_6pt1BCJrS7e5-8L3OnkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to output
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_044754_784273_9A263B20 
X-CRM114-Status: GOOD (  14.78  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgODowOOKAr0FNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMjEsIDIwMjYgYXQg
MDY6NTI6MTlQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDYsIDIw
MjYgYXQgODoyNOKAr0FNIEFuZHJldyBKb25lcwo+ID4gPGFuZHJldy5qb25lc0Bvc3MucXVhbGNv
bW0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT3V0cHV0IHRoZSBydmEyMyh1fHMpNjQgSVNBIGJh
c2VzIHRoYXQgdGhlIElTQSBleHRlbnNpb25zIHByb3ZpZGUgb24KPiA+ID4gbmV3ICdpc2EgYmFz
ZXMnIGxpbmVzIGJvdGggZm9yIHRoZSBMQ0Qgb2YgYWxsIGhhcnRzIGFuZCBwZXIgaGFydCwgYXMK
PiA+ID4gc2hvd24gaW4gdGhlIGV4YW1wbGUgb3V0cHV0IGJlbG93IHdoZW4gYm9vdGluZyBxZW11
IHdpdGgKPiA+ID4gLWNwdSBydmEyM3M2NCxzdjM5PW9uLHBtcD1vbjoKPiA+ID4KPiA+ID4gcHJv
Y2Vzc29yICAgICAgIDogMAo+ID4gPiBoYXJ0ICAgICAgICAgICAgOiA0Cj4gPiA+IGlzYSBiYXNl
cyAgICAgICA6IHJ2NjRpbWEgcnZhMjN1NjQKPiA+ID4gaXNhICAgICAgICAgICAgIDogcnY2NGlt
YWZkY2J2aF96aWNib21femljYm9wX3ppY2Jvel96aWNjYW1vYV96aWNjaWZfemljY2xzbV96aWNj
cnNlX3ppY250cl96aWNvbmRfemljc3JfemlmZW5jZWlfemloaW50bnRsX3ppaGludHBhdXNlX3pp
aHBtX3ppbW9wX3phNjRyc196YWFtb196YWxyc2NfemF3cnNfemZhX3pmaG1pbl96Y2FfemNiX3pj
ZF96Y21vcF96YmFfemJiX3pic196a3RfenZiYl96dmUzMmZfenZlMzJ4X3p2ZTY0ZF96dmU2NGZf
enZlNjR4X3p2ZmhtaW5fenZrYl96dmt0X3NtYWlhX3NtbnBtX3Ntc3RhdGVlbl9zc2FpYV9zc2Nv
ZnBtZl9zc25wbV9zc3RjX3N2YWRlX3N2aW52YWxfc3ZuYXBvdF9zdnBibXQKPiA+ID4gbW11ICAg
ICAgICAgICAgIDogc3YzOQo+ID4gPiBtdmVuZG9yaWQgICAgICAgOiAweDAKPiA+ID4gbWFyY2hp
ZCAgICAgICAgIDogMHgwCj4gPiA+IG1pbXBpZCAgICAgICAgICA6IDB4MAo+ID4gPiBoYXJ0IGlz
YSBiYXNlcyAgOiBydjY0aW1hIHJ2YTIzdTY0Cj4gPiA+IGhhcnQgaXNhICAgICAgICA6IHJ2NjRp
bWFmZGNidmhfemljYm9tX3ppY2JvcF96aWNib3pfemljY2Ftb2FfemljY2lmX3ppY2Nsc21femlj
Y3JzZV96aWNudHJfemljb25kX3ppY3NyX3ppZmVuY2VpX3ppaGludG50bF96aWhpbnRwYXVzZV96
aWhwbV96aW1vcF96YTY0cnNfemFhbW9femFscnNjX3phd3JzX3pmYV96ZmhtaW5femNhX3pjYl96
Y2RfemNtb3BfemJhX3piYl96YnNfemt0X3p2YmJfenZlMzJmX3p2ZTMyeF96dmU2NGRfenZlNjRm
X3p2ZTY0eF96dmZobWluX3p2a2JfenZrdF9zbWFpYV9zbW5wbV9zbXN0YXRlZW5fc3NhaWFfc3Nj
b2ZwbWZfc3NucG1fc3N0Y19zdmFkZV9zdmludmFsX3N2bmFwb3Rfc3ZwYm10Cj4gPiA+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5j
b20+Cj4gPiA+IC0tLQo+ID4gPiArICAgICAgIC8qIFJWQTIzUzY0ICovCj4gPiA+ICsgICAgICAg
c2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJLCBleHRfbWFzayk7Cj4gPiA+ICsgICAgICAg
LyogVE9ETzogU3MxcDEzICovCj4gPiA+ICsgICAgICAgLyogU3ZiYXJlLCBTdjM5IC0tIGFzc3Vt
ZWQgKi8KPiA+ID4gKyAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfU1ZBREUsIGV4dF9tYXNr
KTsKPiA+ID4gKyAgICAgICAvKiBUT0RPOiBTc2NjcHRyLCBTc3R2ZWNkLCBTc3R2YWxhLCBTc2Nv
dW50ZXJlbncgKi8KPiA+Cj4gPiBGb3IgdGhpcywKPiA+Cj4gPiA+ICsgICAgICAgc2V0X2JpdChS
SVNDVl9JU0FfRVhUX1NWUEJNVCwgZXh0X21hc2spOwo+ID4gPiArICAgICAgIHNldF9iaXQoUklT
Q1ZfSVNBX0VYVF9TVklOVkFMLCBleHRfbWFzayk7Cj4gPiA+ICsgICAgICAgc2V0X2JpdChSSVND
Vl9JU0FfRVhUX1NWTkFQT1QsIGV4dF9tYXNrKTsKPiA+ID4gKyAgICAgICBzZXRfYml0KFJJU0NW
X0lTQV9FWFRfU1NUQywgZXh0X21hc2spOwo+ID4gPiArICAgICAgIHNldF9iaXQoUklTQ1ZfSVNB
X0VYVF9TU0NPRlBNRiwgZXh0X21hc2spOwo+ID4gPiArICAgICAgIHNldF9iaXQoUklTQ1ZfSVNB
X0VYVF9TU05QTSwgZXh0X21hc2spOwo+ID4gPiArICAgICAgIC8qIFRPRE86IFNzdTY0eGwgKi8K
PiA+ID4gKyAgICAgICAvKiBUT0RPOiBTaGEgPSBTc3N0YXRlZW4sIFNoY291bnRlcmVudywgU2h2
c3R2YWxhLCBTaHR2YWxhLCBTaHZzdHZlY2QsIFNodnNhdHBhLCBTaGdhdHBhICovCgpIaSwgZHJl
dwoKQWJvdXQgJ1NoYScsIHlvdXIgcmVhZGluZyBvZiB0aGUgcHJvZmlsZS9zcGVjLCBkbyB5b3Ug
cHJlZmVyIHRvIGRlZmluZQpTaGEgYXMgYSBfQlVORExFIG9yIGFzIGEgX1NVUEVSU0VUKCkgd2hp
Y2ggaGFzIGl0cyBvd24gaWQ/CgpJIGRlZmluZWQgaXQgYXMgX1NVUEVSU0VUKCkgaW4gbXkgcGF0
Y2ggOC84IFsxXSwgYnV0IHdpdGggdG9kYXkncyBjb2RlCnJldmlldywgSSBndWVzcyBidW5kbGUg
aXMgYSBiZXR0ZXIgZml0LiBXaGF0IGRvIHlvdSB0aGluaz8KCkJUVywgU2hhID0gSCArIDcgb3Ro
ZXJzLiBJdCBpbmNsdWRlcyBILgoKQlIsCkd1b2RvbmcKCj4gPgo+ID4gQW5kIHRoaXMsIHRoZXNl
IFRPRE9zLCBJJ2QgYmUgaGFwcHkgaWYgbXkgcGF0Y2hlcyA3IGFuZCA4IFsxXSBjYW4gYmUKPiA+
IHVzZWZ1bCBoZXJlLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDIwNy1pc2EtZXh0LXBhcnNlLWV4cG9ydC12MS03LWE2NGQzYThiYzIwYUByaXNjc3Rhci5j
b20vCj4gPiBbMV0KPgo+IEFic29sdXRlbHkhCj4KPiBUaGFua3MsCj4gZHJldwoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
