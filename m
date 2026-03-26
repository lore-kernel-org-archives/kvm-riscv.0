Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E2610A88E7
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ejoLiJv+T2lu2fl8TT8tCkzMDeyOhIqiOcjhSNEK5M=; b=GkL7VvIkEM1hN3
	gznSUJkSG1MAU/DCTeNogwRTsDad5cCO6AVWUwaamHAaU3l2CBxblsfe3xEdtsLFKVPREq+zzXGYx
	00XEM+rhfrS1ZDyDmvz5qvFcOQ4BaOK0JRssUsomBKtp0gNtqe8cNR1NnT3Tytn4DZaAFpmnKzDYQ
	MgTG6gVhulwEwLPsDSQnWdbTaf/MSUv5XSvdJ8ekSkpAwDa3Dz5Y1xKtOC0Sx2Ydrtb6TWJ/6YwEM
	JFASusTaEwuRcS8LQQvzNbAJbJmPa48g4rvuvdMpWcAFuYN6y1h1GqSqR+x9MMLnLsXIyVU4kq8cc
	U0dc9CAc67yS+7052EmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oYv-00000005xae-2YNL;
	Thu, 26 Mar 2026 17:32:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oYt-00000005xXt-0yXq
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 17:32:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QFAAnq4004276
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Mar 2026 17:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPbpzrC2aPa4EGCloOgWbFEDSRaP05NlTmZeiPLlyww=; b=nhEQV86moGMY711b
	Nh3LuQ6mylVdcg0h1yyIvqm4tG/omkJum1sHAjmI3qJqqjlgKE4/6MiFrSzOuSin
	aNOq3UfNw4Ni3YO3MpFmTyuKwhK+i04aTzSyu6XaMOVzfcIYfZqCnLRdE+V+xMLl
	8e+N1eBzSbQ7npZNwP+1XfBa/whu/SZdu+rDANrUUTALzcVdRUGlVgx+XF71N9BT
	NgZl/dp/lHmVdt906sSZKEsaEho7IPUo+4JU2neGEz86+vNfb2U0EYuNQAc92fRL
	R7tGYEATX4OHFRKgqWnPqt9WldyUaLPBlP2+h9AsY3Np+w1Ei1wF8pe6ExCReEir
	iPIZag==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn3983-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Mar 2026 17:32:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso7467604c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 26 Mar 2026 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774546322; x=1775151122; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPbpzrC2aPa4EGCloOgWbFEDSRaP05NlTmZeiPLlyww=;
        b=feEgi/yb2QjrNcBOauPaoSqD3gsoPNx/Zn8EkGrGd/blBauzVUuChh/C6QwzCV2TCW
         PpmbScGztM48PKKsRJZlInkzIJyYCa1qeJeaG8qfp2K7aOsoWSv0rG6qnmcWCKlCzjSX
         KBOlz17BdTB/1Rx/cDt/Jsf86FTvi0c2NxPDG1a6c0D/qiSgBHdoKK071bKJGMLYegzi
         Uh8opwwVFlDP1GtvealyXKEhOSnetKktomh5PdfqltQ9C3cjWw7joVrqts9bqekH1kBh
         OfIUPWQAalOkWeSfMNOKhOchT4/8pcrNp4N0TVXun8P66Fk3GERtehR50/iV7HlOuUEZ
         MeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546322; x=1775151122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPbpzrC2aPa4EGCloOgWbFEDSRaP05NlTmZeiPLlyww=;
        b=s/FmD7AFgWuYza6RMTAy847v9z6Lg77svDEKw9FDTWlHn/b6LEFJ0QGY1z63aV2ChF
         Felh9M5bIDGG5/HXWOV5fFfOOq88ZywwFdHDGwQnY8/Sq8k8G0Us2ZoNAEjgpZPUINYj
         nBlWazYd73RQxDRtE+Xhm05ZQUzmcK7oIaSoFmiUI4RhXevEGv91RzgMNgE5TdxhogiV
         RtBV010IVAt1Kydbdr1hVhsqkzjaEE4ZOw3Hclwx8/PpDyPC1kfysZrjW2OxwJ49r25I
         l4sDReq+mS4zia97/u21g5EndJ5+Aj1sqeN51c9RofAJb3eFKWAsZxoWn4SH+0XkYBHh
         ixzA==
X-Forwarded-Encrypted: i=1; AJvYcCWU723csAQI8HtjAeqUFTwjSbYre7Den9/5foUXwncIIYIJtIyFDxz4VhYGg8DMSSmnfbPdO5S/JZA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWWUZMd32DzpmriZQkeXkE6ZrDT7xCatToBLg4u1SssYVtKoah
	ytJ0+s3oVsgBaoF1rKl4qu6cCF7DLMdSnCJsFU99HK7pnE1QpdZRt2AlwVP5pYIbLgcLV50mHu/
	+X6w6Z8J5ZciWljq46dFjyZ1g/xTGue65S9WCdgBxkkA5OE4xcG6A9mVlqpBfFfrTqLES
X-Gm-Gg: ATEYQzz2FU1f8CDU1DO1E3V0EwtlhDBnQqlGFLh8q2OOiH3rhnkcINKzuZUQ2cGV39o
	Tb/Rg/e91giHNkoRg2E9Siz3JggHZSMEVnl0kQC+Vyhkeh2dp0JdPZH/BYgjtaSmgolp8zoEKsl
	h1Mpbp+He6WBh0RlH3hW1+czU0ngKMfD9YdaFPz4RGVFW0vPEBTCduD/PEt236ZfPEdJ8iJpdjq
	4F2F03MP3iBIicP9qBTxXcbPbgghWwqc7H7vb1Kdyt4hHZ72YBROjjWjAEXqwxTnlelgwjOoIWL
	5a9zzQEHAGTMf7jyQ8x7VhmNfKpDmWz1ZQuuzODYrpk/G+/VtGhxYHJcfJve6kM/mn+1iVwn1Rz
	OOPuWV/LZLvMwcl8/GnujiaU0DnLLXnk=
X-Received: by 2002:a05:7022:ea32:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12a96b81410mr5209924c88.0.1774546322021;
        Thu, 26 Mar 2026 10:32:02 -0700 (PDT)
X-Received: by 2002:a05:7022:ea32:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12a96b81410mr5209889c88.0.1774546321377;
        Thu, 26 Mar 2026 10:32:01 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec26651sm3075347eec.2.2026.03.26.10.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:32:00 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:31:59 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Jason Gunthorpe <jgg@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, anup@brainfault.org,
        atish.patra@linux.dev, alex.williamson@redhat.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <cllm27bdn63x7r6zmpgtyssarybhd4i6l7l2sdxvv6bxnghhol@jyfya7yihymi>
References: <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com>
 <20250923-b85e3309c54eaff1cdfddcf9@orel>
 <20250923152702.GB2608121@nvidia.com>
 <20250923-e459316700c55d661c060b08@orel>
 <20250923162302.GC2608121@nvidia.com>
 <20250923-b2caf55f4f87f05aaa619e0b@orel>
 <CABvJ_xjnVJjV2GnYr=1WuXqo9VivNXniq8BJ39LQNwaT6vUiQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABvJ_xjnVJjV2GnYr=1WuXqo9VivNXniq8BJ39LQNwaT6vUiQQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyNSBTYWx0ZWRfXym62BlyXvJwZ
 mEVBfl5ohHMPaOGwa2rLhjbOHl/o0V7Arc/zEf3vurYMpI0vxWiJ/CRHDus2hX9ncGrp8xowt3X
 ei/K6ERGdtfa551Vwjc3haNT64djZ/3lpfZZv1UQrXb4OsE2sOO3h5Ug1NeRs0R8Vqx4qla2r5b
 iFNZE14fucX1OB/TiH5YvqS2h6o9HfNM2+Wf9DFTjax3Lxpf+LsWRvmxZv1xGxL/Guui10UnWYU
 pnYlTQF7RTkNGowme0WPpz/FfdSZNl+k+nA35VKJuwHOOdco2nYcrMEP5c8NXG/0ckHmB5Kv1X6
 +H6kGdIbvv7w0yHnwJifJ4mWbr5HDaTNT0mft9jF9ihxkXc0eBeP+PZt+65h8ZXqrldmEmhYRWP
 66t2rvGGvsR+31wX9PAc/2zYvVldf/fCtdCBMd3ftKI/eh1ay+jweUB8a/e3xkarOcEAZnIUUP8
 2L7Edl0ULjG7LV/x/9w==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c56d92 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bDdBU3oEAAAA:8 a=kVzS7ww4oF5vT_6CylwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: wBSIeMKEMIwaTvdFWPnBz-FBU9KYzIB0
X-Proofpoint-ORIG-GUID: wBSIeMKEMIwaTvdFWPnBz-FBU9KYzIB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_103203_286585_F5367B74 
X-CRM114-Status: GOOD (  45.00  )
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

T24gVHVlLCBNYXIgMjQsIDIwMjYgYXQgMDU6MTI6MjZQTSArMDgwMCwgVmluY2VudCBDaGVuIHdy
b3RlOgo+IE9uIFdlZCwgU2VwIDI0LCAyMDI1IGF0IDEyOjM04oCvQU0gQW5kcmV3IEpvbmVzIDxh
am9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBTZXAgMjMsIDIw
MjUgYXQgMDE6MjM6MDJQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIFNlcCAyMywgMjAyNSBhdCAxMDo1MDo1NkFNIC0wNTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6
Cj4gPiA+ID4gWWVzLCB0aGlzIGlzIHRoZSBwYXJ0IHRoYXQgSSdkIGxpa2UgdG8gbGVhbiBvbiB5
b3UgZm9yLCBzaW5jZSBJIHVuZGVyc3RhbmQKPiA+ID4gPiB3ZSB3YW50IHRvIGF2b2lkIHRvbyBt
dWNoIEtWTS92aXJ0IHNwZWNpYWwgY2FzaW5nIGZvciBWRklPL0lPTU1VRkQuIEkgd2FzCj4gPiA+
ID4gdGhpbmtpbmcgdGhhdCBpZiBJIGJpdCB0aGUgYnVsbGV0IGFuZCBpbXBsZW1lbnRlZCBuZXN0
ZWQgc3VwcG9ydCB0aGFuIHdoZW4KPiA+ID4gPiBuZXN0aW5nIHdhcyBzZWxlY3RlZCBpdCB3b3Vs
ZCBiZSBhcHBhcmVudCB3ZSdyZSBpbiB2aXJ0IGNvbnRleHQuIEhvd2V2ZXIsCj4gPiA+ID4gSSB3
YXMgaG9waW5nIHRvIHB1bGwgdG9nZXRoZXIgYSBzb2x1dGlvbiB0aGF0IHdvcmtzIHdpdGggY3Vy
cmVudCBRRU1VIGFuZAo+ID4gPiA+IFZGSU8gdG9vLgo+ID4gPgo+ID4gPiBZb3UgcHJvYmFibHkg
ZG8gaGF2ZSB0byBtYWtlIG5lc3RlZCBwYXJ0IG9mIHRoaXMsIGJ1dCBJIGRvbid0IGhhdmUgYQo+
ID4gPiBjbGVhciBwaWN0dXJlIGhvdyB5b3UnZCB0aWUgYWxsIHRoZSBwYXJ0cyB0b2dldGhlciB0
aHJvdWdoIHRoZSBuZXN0ZWQKPiA+ID4gQVBJLi4KPiA+ID4KPiA+ID4gU29tZWhvdyB5b3UgaGF2
ZSB0byBsb2FkIGEgbXNpcHRwIHRoYXQgaXMgZWZmZWN0aXZlbHkgbGlua2VkIHRvIHRoZQo+ID4g
PiBLVk0gcmVsaWFibHkgaW50byB0aGUgREMgZm9yIHRoZSBpb21tdWZkIGNvbnRyb2xsZWQgZGV2
aWNlcyB0aGF0IGFyZQo+ID4gPiBsaW5rZWQgdG8gdGhhdCBLVk0uIFRoZW4gc3luY2hyb25pemUg
d2l0aCBWRklPIHRoYXQgdGhpcyBpcyBkb25lIGFuZAo+ID4gPiBpdCBjYW4gc2V0dXAgS1ZNIG9u
bHkgaW50ZXJydXB0cyBzb21laG93LiBUaGlzIGt2bSBlbnRhbmdsZW1lbnQgaXMgdGhlCj4gPiA+
ICJ2aXJ0IiB5b3UgaGF2ZSBtZW50aW9uZWQgbWFueSB0aW1lcy4KPiA+Cj4gPiBZZXMsIHRoZSBW
RklPK0tWTSBpcnFieXBhc3MgZnJhbWV3b3JrIGN1cnJlbnRseSBwcm92aWRlcyBtdWNoIG9mIHRo
aXMKPiA+IHN1cHBvcnQgKHdoaWNoIHBhdGNoZXMgMTAtMTcgb2YgdGhpcyBzZXJpZXMgbGV2ZXJh
Z2UpLiBCdXQsIGlmIHVzaW5nCj4gPiBuZXN0ZWQgaXMgbmVjZXNzYXJ5IGluIG9yZGVyIHRvICJz
aWduYWwiIHRvIHRoZSByZWxldmFudCBzdWJzeXN0ZW1zIHRoYXQKPiA+IHRoZSBkZXZpY2UncyBp
cnFzIHdpbGwgdHJ1bHkgYmUgaXNvbGF0ZWQsIHRoZW4gSSdsbCBuZWVkIHRvIHN0YXJ0IGZpZ3Vy
aW5nCj4gPiBvdXQgaG93IGlvbW11ZmQgY2FuIGZpdCBpbnRvIHRoZSBtaXggKG9yIGlmIHdlJ2xs
IG5lZWQgYW4gaW9tbXVmZC1zcGVjaWZpYwo+ID4gaW1wbGVtZW50YXRpb24gZm9yIGEgbmV3IG1p
eCkuCj4gPgo+IAo+IEhpIEFuZHJldyBhbmQgSmFzb24sCj4gCj4gSSBqdXN0IG5vdGljZWQgdGhp
cyB0aHJlYWQsIHNvIGFwb2xvZ2llcyBpZiBJIG1pc3NlZCBhbnkgcHJpb3IgY29udGV4dAo+IG9y
IGlmIHRoaXMgaGFzIGFscmVhZHkgYmVlbiBkaXNjdXNzZWQuCj4gCj4gSWYgSSB1bmRlcnN0YW5k
IGNvcnJlY3RseSwgdGhlIGN1cnJlbnQgZGlzY3Vzc2lvbiByZXZvbHZlcyBhcm91bmQKPiB1c2lu
ZyBuZXN0ZWQgdHJhbnNsYXRpb24gdG8gaWRlbnRpZnkgYSBzYWZlICJWaXJ0IENvbnRleHQiIGZv
ciBWRklPLAo+IGxhcmdlbHkgYmVjYXVzZSB0aGUgYmFzZSBSSVNDLVYgSU9NTVUvSU1TSUMgZG9l
c24ndCB2YWxpZGF0ZSBNU0kgZGF0YSwKPiBsZWF2aW5nIG5vbi12aXJ0IGNhc2VzIHZ1bG5lcmFi
bGUgdG8gTVNJIHNwb29maW5nLgo+IAo+IEknZCBsaWtlIHRvIHNoYXJlIGFuIGFsdGVybmF0aXZl
IGlkZWEgYW5kIHNlZSBpZiBpdCBtaWdodCBiZSBhIHZpYWJsZQo+IGRpcmVjdGlvbiBmb3IgdGhp
cyBzY2VuYXJpby4KPiAKPiBBcyBBbmRyZXcgbWVudGlvbmVkLCBzaGFyaW5nIHRoZSBzYW1lIElN
U0lDIGZpbGUgd2l0aG91dCBkYXRhCj4gdmFsaWRhdGlvbiBtYWtlcyBpdCBkaWZmaWN1bHQgdG8g
cHJldmVudCBzcG9vZmluZy4gSG93ZXZlciwgd2hhdCBpZiB3ZQo+IGNvbnNpZGVyIHV0aWxpemlu
ZyB0aGUgTVJJRiAoTWVzc2FnZSBSZXF1ZXN0IEludGVyZmFjZSBGaWxlKSBmZWF0dXJlCj4gZm9y
IFZGSU8gcGFzc3Rocm91Z2ggZGV2aWNlcz8KPiAKPiBXaGlsZSBNUklGIGlzIHByaW1hcmlseSBk
ZXNpZ25lZCB0byBleHRlbmQgdGhlIG51bWJlciBvZiBndWVzdCBJTVNJQ3MsCj4gdGhlIHNwZWNp
ZmljYXRpb24gZG9lc24ndCBzZWVtIHRvIGxpbWl0IGl0cyB1c2FnZSBzdHJpY3RseSB0byB0aGUg
VmlydAo+IENvbnRleHQuIElmIHdlIGFzc2lnbiBhIGRlZGljYXRlZCBNUklGIHRvIGEgcGFzc3Ro
cm91Z2ggZGV2aWNlIChldmVuCj4gZm9yIG5vbi12aXJ0L3VzZXJzcGFjZSBjYXNlcyksIHRoZSBk
ZXZpY2Ugd291bGQgb25seSBiZSBhYmxlIHRvIHNlbmQKPiBNU0lzIHRvIGl0cyBvd24gaXNvbGF0
ZWQgTVJJRiB2aWEgdGhlIElPTU1VIE1TSSB0YWJsZS4KPiAKPiBJbiB0aGlzIHNldHVwLCB0aGUg
YWN0dWFsIGludGVycnVwdCBkZWxpdmVyZWQgdG8gdGhlIHBoeXNpY2FsIENQVQo+IHdvdWxkIGJl
IHRoZSBOb3RpY2UgTVNJIGdlbmVyYXRlZCBieSB0aGUgSU9NTVUgaGFyZHdhcmUgaXRzZWxmLiBT
aW5jZQo+IHRoZSBhZGRyZXNzIGFuZCBkYXRhIG9mIHRoaXMgTm90aWNlIE1TSSBhcmUgc3RyaWN0
bHkgY29uZmlndXJlZCBieSB0aGUKPiBIb3N0IE9TLCB0aGUgZGV2aWNlIHdvdWxkbid0IGJlIGFi
bGUgdG8gc3Bvb2YgTVNJcyB0byB0aGUgSG9zdCBvcgo+IG90aGVyIGRldmljZXMuCj4gCj4gSWYg
bXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LCB0aGlzIGFwcHJvYWNoIG1pZ2h0IG5hdHVyYWxs
eSBwcm92aWRlCj4gdGhlIGlzb2xhdGlvbiBuZWVkZWQgZm9yIElSUV9ET01BSU5fRkxBR19JU09M
QVRFRF9NU0kgYWNyb3NzIGJvdGggdmlydAo+IGFuZCBub24tdmlydCBjb250ZXh0cywgcG90ZW50
aWFsbHkgc2ltcGxpZnlpbmcgdGhlIG5lZWQgZm9yIEtWTS9WRklPCj4gc3BlY2lhbCBjYXNpbmcu
Cj4gCj4gSSB3b25kZXIgaWYgdGhpcyBhcHByb2FjaCB3b3VsZCBiZSBhY2NlcHRhYmxlLCBvciBp
ZiB0aGVyZSBhcmUgYW55Cj4gaGFyZHdhcmUvc29mdHdhcmUgY29uc3RyYWludHMgSSBtaWdodCBo
YXZlIG92ZXJsb29rZWQ/Cj4KCkhpIFZpbmNlbnQsCgpUaGFuayB5b3UgZm9yIHlvdXIgdGhvdWdo
dHMgb24gdGhpcy4gSSBhZ3JlZSB0aGF0IHVzaW5nIE1SSUZzIHdvdWxkCmFsbG93IElSUV9ET01B
SU5fRkxBR19JU09MQVRFRF9NU0kgdG8gYmUgc2V0LiBJbmRlZWQgdGhhdCBtYXkgYmUgdGhlCmJl
c3Qgd2UgY2FuIGN1cnJlbnRseSBkbyBmb3IgdXNlcnNwYWNlIGRldmljZSBhc3NpZ25tZW50LiBG
b3IgZ3Vlc3QKZGV2aWNlIGFzc2lnbm1lbnQgd2UgY2FuIGFscmVhZHkgZG8gc29tZXRoaW5nIHNp
bWlsYXIgYnkgc2ltcGx5IG5vdAppbXBsZW1lbnRpbmcgaXJxYnlwYXNzIGF0IGFsbCAoVkZJTyB3
aXRob3V0IGlycWJ5cGFzcyBkb2VzIGVzc2VudGlhbGx5CnRoZSBzYW1lIHRoaW5nKS4KCkkgcGxh
biB0byBwb3N0IGFub3RoZXIgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyB3aGljaCB3aWxsIG9ubHkg
dXNlIHRoZQpNU0kgdGFibGUgZm9yIGd1ZXN0cywgc2luY2UgSSBuZWVkIGctc3RhZ2UgdG8gbm90
IGJlIEJhcmUgaW4gb3JkZXIgdG8KZW5hYmxlIHRoZSBNU0kgdGFibGUgYW55d2F5LCBidXQgd2Ug
ZG9uJ3Qgd2FudCB0byB1bm5lY2Vzc2FyaWx5IG1lc3MKd2l0aCBnLXN0YWdlIGZvciBub24tdmly
dCB1c2VzLgoKVGhhbmtzLApkcmV3CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
