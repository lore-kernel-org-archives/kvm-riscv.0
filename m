Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5628FF885A
	for <kvm-riscv@archiver.kernel.org>; Mon,  4 May 2026 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=looUlEFhSVeCNrelA55FHf28gN6g3yHzQxmgWeJhSyw=; b=WqyyhhUrsFW86i
	Kl4Rqg9pAugsuT7Ee1UVPbZ5NI6Y/NhBiOmoyh/TilkPhcH6u2MmZYBo7qpm7wACkEVTeYlj6yXmA
	2lC/BZWu/m4gO7ExifevaTD9jehvZFVHni7fxDrKyImxs5vfFc3fzyPudDTM6YjLX8yULLIQBL/SV
	gz6VY2BffqprW6Jz6YLo6tMQgk2OqxbPMXZQnyDkQ0kTHQTcz1jGiW0vblH7Hacpzv3KOLjtvj2yF
	8JkpkJFoQtsPCmCULApjfDE5mmchTFEH3mji/L3u1JKO5Rid9aGOkU8pMuVUbgZJN57sthsZ4tCTl
	mWAZRteuAzxSiYgKiBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzLx-0000000ECn8-0dWc;
	Mon, 04 May 2026 19:53:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzLu-0000000ECm5-3wwk
	for kvm-riscv@lists.infradead.org;
	Mon, 04 May 2026 19:53:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644J35tZ749090
	for <kvm-riscv@lists.infradead.org>; Mon, 4 May 2026 19:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ploYMy0AO9N2sXsyPdbZNrPHPfiBphdWIDBYxYTu3gs=; b=puq8KFDGz9s1l076
	9fXvFzlevSb59poqwX3Xls1uQG6DW+ISL7h3hkc/3hZ1kWmKGTyoV6qJCkQ454/H
	8BdaTU5vSoZed3aSBRiD1GtSqJSeJEPXm06SPmDlI6hcnl+MVMvgiX/MIxoDBPyE
	702HJV7wx3rT4otbew5lO5juRPdZIqP2zY2hgN2admZc+RW1r+nhojPZ+6X5Sq9a
	aQb0hRHpUhkBfqSjn3y5zRENpG6j+sIzjUFXBAVORKwljL1nuRLf/Yd3YN8KVFMQ
	d2n2c8YET6REnQeK1c+ZfBfRED4qxKk7MrqVMvkt5iIeV6is4gi9LBrXGo2cApxo
	0EJtyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf23vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 04 May 2026 19:53:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so5843156eec.1
        for <kvm-riscv@lists.infradead.org>; Mon, 04 May 2026 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777924392; x=1778529192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ploYMy0AO9N2sXsyPdbZNrPHPfiBphdWIDBYxYTu3gs=;
        b=EQCLokRXoEdY59cIQ0CJAIiA4AMkyn7LZIDQQEfbKsVRHOphXylpeoW8KiTN8OuUap
         M2P//p+1zU1qWJrjoUGyNXtK7Io+xC/yQmpMqPAfFrwAMDrm+D2Y4lxwxjL2YQLe2691
         qQOZLeP38KJbOuzydJ/qe/ZEllaSJqc+S21F8eV4/6Xe4Rbq3IZ3MC+6iwR9kQwWAJo4
         E5kd5WHNE2u1uDFDm1RA/oh1t1Cj8tJUTZHpAjoTwn0h4cmRUhPlVFlJFH5ximK2airU
         qs908+lMcLUV+G0wChpOnVEWRHgQGSlFdwx85HmafwhMhrwmfe+qIEZQHrdRsG3dJjYF
         SYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777924392; x=1778529192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ploYMy0AO9N2sXsyPdbZNrPHPfiBphdWIDBYxYTu3gs=;
        b=J6jGPM8UVHAVvc6p80Db8ESxrqloBDVkXvd2p9vRYiLHyiBQJck/K3toIdFFlvx46s
         MacSB0vfqfCRxTHnJa2DnqEP3s5UNxQ8i0IQ7DpcCODxgOkM1rtYcvGCqv4ai3yK89VK
         U7x7R4561Qs6+hQkiVjlzrKWBTKli1R6aKQ4PrbIA8wVikmfEYJ3ny3EJbpAW7hVfOt7
         kd8Drb7e8nO3JeGNfYW4rWWAv9PamwaaTiKQb0Mhfn8B/tN62i2nlnLfbPZqykwceU6v
         8fwzKlFQyV4FuQT4ad+pOox5NE2Fo0LI5A2uQANaZcf9JBYwQHk90uHtcNsBaer9WJq1
         T6TA==
X-Forwarded-Encrypted: i=1; AFNElJ+hB1kMEiVVkeqpgOBWf854JaEe9/hwMBA0x0Ff44YzC2b1BoCC9PBFrPFb+5/aPMRod5xtJ6sA3y4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuN9BMZjQPl73kla5b678uqpcXrBE3v5kh9xz4JhXhsaLrRaCW
	AnZm9JTyOjG9EhlhZWOxIc3Cei6y+YSFijWtFesrLACasUoZ6AxIrMO4qNfIxJ97DtmyTRTu8O7
	5aOMnM7QXZt2pwP5LUH40fT2WRwdu4joCuXRqqWxe0sQ7kZRDPn361caX6h8lwUHus7PhiKFF87
	v5
X-Gm-Gg: AeBDiesZ/Y+oCRZNql9LkjjfUMz8HE/0wNGEXSvB4ph+0bGCsW9cvEjtKZGzQuw48+4
	03ngxjdVN28ElLHD5nawRHVQgjmryc2U+A69g59qylVqSKodixVLE0OiwyjTqb+CsxEzrEfCFyN
	82oii1FRqQJVpgq4KXum7q+MVqBvvH7cQaFE/0ZBX0ZY2M1N1BNAjvo/Cdb5xNvs8TwZD2ENGco
	JNv5/oQREzRcWN3nygOmrc4D7rcP7lCsO9v7lB2+CQWIYGxR1xJwJbTY2xWtjkYV0PtZ6IO6mdW
	FQRIug6Opc1w4csNGhocEfZ8A9bJgYLRqN994ayrv3X25j8kADSf340wlb6TZvDY4zD4rBfex5a
	fXLg58OIgSqu7CYDEcsGME1QE7mvFInEOXz70rDch
X-Received: by 2002:a05:7301:678f:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-2efba17a51fmr5429701eec.26.1777924392209;
        Mon, 04 May 2026 12:53:12 -0700 (PDT)
X-Received: by 2002:a05:7301:678f:b0:2ed:27a3:eae3 with SMTP id 5a478bee46e88-2efba17a51fmr5429683eec.26.1777924391681;
        Mon, 04 May 2026 12:53:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm17660932eec.22.2026.05.04.12.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:53:11 -0700 (PDT)
Date: Mon, 4 May 2026 14:53:09 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
        atish.patra@linux.dev, skhawaja@google.com, jgg@nvidia.com,
        guoren@kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/11] iommu/riscv: Add hardware dirty tracking for
 second-stage domains
Message-ID: <tdcd7276ffsfc6vh3expyfcajnfkowknbtkpyplb3xe3dcukj2@tnhi6jcwrfgn>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f8f929 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=SRrdq9N9AAAA:8 a=O0cgCnXdde_TIKaFu4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE4MiBTYWx0ZWRfXzTlF6B2dfs9j
 aLf940ZbDF6EKfZPWNaMhxjdg/xNdlkFg7Iu9gAZ163WRGpH6eULndTXnsSemK4v/S4uRQCpZK7
 ol+KXXl0E+W/JyznQGcnBJ6GvYhlXB9jd6CAPyJPDwoMaOa1PpQFE1PRKtIjAU0q/n/ywCaLMiw
 u+s4h5B8jGkCWzphv5L1Zh2Bt94g9o1nhD5IrgcdxxYq4K5CsDGK5rPUazwjmdWU8neOKO0WSHf
 0t+60ULll0C7JvtBR8yvZO2wfrRYdPY7dyfKPHtxCcODLomS3En2abSH2qJOOIzePAt2nJoCo+W
 qJ5z9+eztZ/kF6ZVEee8sAIvoD1jjB/iVDwVq41Vc+y4ZKjg3HBk4hkPRgaecIX4zJGuOrMX6W4
 LASRwqu+BDd3oMgARFhXQCV5eitWKfIHzfOrBvA5MNdNhQldUo2ZjTEwCeJ9DA9pzZZf9A+JiDF
 KZDyQGDzo/d6QX1KgCw==
X-Proofpoint-ORIG-GUID: IU67zoQvtlnTylTYk5jlzdrBvcBRgzF4
X-Proofpoint-GUID: IU67zoQvtlnTylTYk5jlzdrBvcBRgzF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_125315_164015_B4F4D9A7 
X-CRM114-Status: GOOD (  20.88  )
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

T24gVHVlLCBBcHIgMjgsIDIwMjYgYXQgMDk6MTM6NDhQTSArMDgwMCwgZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tIHdyb3RlOgo+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFs
aWJhYmEuY29tPgo+IAo+IFRoZSBSSVNDLVYgSU9NTVUgYXJjaGl0ZWN0dXJlIGRlZmluZXMgYW4g
QU1PX0hXQUQgY2FwYWJpbGl0eSAoSGFyZHdhcmUKPiBBY2Nlc3MvRGlydHkgdXBkYXRlKSB0aGF0
IGFsbG93cyB0aGUgSU9NTVUgdG8gYXRvbWljYWxseSBzZXQgdGhlIEEvRCBiaXRzCj4gaW4gc2Vj
b25kLXN0YWdlIFBURXMgb24gRE1BIGFjY2Vzcy4gIFdoZW4gREMudGMuR0FERSBpcyBhc3NlcnRl
ZCwgdGhlIElPTU1VCj4gYXV0b25vbW91c2x5IHNldHMgRCBvbiB0aGUgZmlyc3Qgd3JpdGUgdG8g
YSBwYWdlIG1hcHBlZCBieSBhbiBpb2hnYXRwCj4gZG9tYWluLiAgVGhpcyBzZXJpZXMgd2lyZXMg
dGhhdCBjYXBhYmlsaXR5IHVwIHRvIHRoZSBpb21tdWZkIGRpcnR5LXRyYWNraW5nCj4gaW50ZXJm
YWNlIChJT01NVV9IV1BUX1NFVF9ESVJUWV9UUkFDS0lORyAvIElPTU1VX0hXUFRfR0VUX0RJUlRZ
X0JJVE1BUCkgYW5kCj4gcmVwb3J0cyBJT01NVV9DQVBfRElSVFlfVFJBQ0tJTkcuCj4gCj4gRGVz
aWduIG5vdGVzCj4gLS0tLS0tLS0tLS0tCj4gCj4gKiBUaGUgZmVhdHVyZSBpcyBzY29wZWQgdG8g
c2Vjb25kLXN0YWdlIChpb2hnYXRwKSBkb21haW5zIG9ubHk7IHRoZXNlIGFyZQo+ICAgdGhlIGRv
bWFpbnMgY3JlYXRlZCBmb3IgS1ZNIC8gVkZJTyBkZXZpY2UgcGFzcy10aHJvdWdoIHdoZW4gdXNl
cnNwYWNlCj4gICBhbGxvY2F0ZXMgYW4gSFdQVCB3aXRoIElPTU1VX0hXUFRfQUxMT0NfTkVTVF9Q
QVJFTlQgb3IKPiAgIElPTU1VX0hXUFRfQUxMT0NfRElSVFlfVFJBQ0tJTkcuICBGaXJzdC1zdGFn
ZSAoaW9zYXRwKSBkb21haW5zIGFyZSBub3QKPiAgIHRvdWNoZWQgYnkgdGhpcyBzZXJpZXMuCj4g
Cj4gKiBUaGUgcGFnZS10YWJsZSBzaWRlIHBsdWdzIGludG8gdGhlIGV4aXN0aW5nIGdlbmVyaWNf
cHQgZGlydHkgaG9vawo+ICAgZnJhbWV3b3JrIChhbWR2MSAvIHZ0ZHNzIHN0eWxlKS4gIFJJU0Mt
ViBhZGRzIHRoZSB0aHJlZSByZXF1aXJlZCBQVEUKPiAgIG9wcyDigJMgaXNfd3JpdGVfZGlydHkg
LyBtYWtlX3dyaXRlX2NsZWFuIC8gbWFrZV93cml0ZV9kaXJ0eS4KPiAKPiBUZXN0aW5nCj4gLS0t
LS0tLQo+IAo+ICogVGVzdCBvbiBRRU1VIFJJU0MtViwgYSB2aXJ0aW8tbmV0IGFuZCBhbiBlMTAw
MGUgZGV2aWNlIHdhcyBwYXNzZWQgdGhyb3VnaAo+ICAgdG8gYW4gTDIgZ3Vlc3QgdmlhIHZmaW8t
cGNpICsgaW9tbXVmZC4KPiAKPiAqIGdlbmVyaWNfcHQgS1VuaXQ6IHRoZSBleGlzdGluZyB0ZXN0
X2RpcnR5IGNhc2Ugbm93IHJ1bnMgYW5kIHBhc3NlcyBmb3IKPiAgIHRoZSBSSVNDLVYgNjQtYml0
IGZvcm1hdC4KPiAKPiBGb2xsb3ctdXAgd29yawo+IC0tLS0tLS0tLS0tLS0tCj4gKiBCdWlsZCBh
IGRlZGljYXRlZCBlbmQtdG8tZW5kIHRlc3QgY2FzZSB0aGF0IGRyaXZlcyB0aGUgZnVsbCBmbG93
Cj4gICAoSFdQVF9BTExPQyB3aXRoIERJUlRZX1RSQUNLSU5HIC0+IGF0dGFjaCAtPiBJT0FTX01B
UCAtPiBnZW5lcmF0ZSByZWFsCj4gICBETUEgLT4gU0VUX0RJUlRZX1RSQUNLSU5HIC0+IEdFVF9E
SVJUWV9CSVRNQVAgLT4gdmVyaWZ5IGJpdG1hcCBhZ2FpbnN0Cj4gICBleHBlY3RlZCBJT1ZBIGZv
b3RwcmludCkgc28gdGhhdCB0aGUgYmVoYXZpb3VyIGNhbiBiZSByZWdyZXNzaW9uLXRlc3RlZAo+
ICAgYmV5b25kIHRoZSBLVW5pdCBQVEUtbGV2ZWwgY292ZXJhZ2UuCj4gCj4gKiBJZiBwb3NzaWJs
ZSwgcmViYXNlIGFuZCByZXRlc3Qgb24gdG9wIG9mIHRoZSB1cGRhdGVkICJpb21tdSBpcnFieXBh
c3MiCj4gICBwYXRjaHNldC4KClRoYW5rcyBmb3IgdGhpcyBzZXJpZXMhIEkgd2FzIHN0YXJ0aW5n
IHRvIGdvIGRvd24gYSBzaW1pbGFyIHJvYWQgbXlzZWxmCmluIG9yZGVyIHRvIGxpbWl0IGlycWJ5
cGFzcyB0byBJT01NVV9IV1BUX0FMTE9DX05FU1RfUEFSRU5UIGRvbWFpbnMgc2luY2UKSSB3YXNu
J3QgaGFwcHkgd2l0aCBvdGhlciBhcHByb2FjaGVzLCBlLmcuIGNvbnRpbnVpbmcgdG8gdXNlIHMt
c3RhZ2UsIGJ1dAphY3RpdmF0aW5nIGctc3RhZ2UgdG9vIHdpdGggaWRlbnRpdHkgbWFwcGluZ3Mg
c2luY2UgdGhlIE1TSSB0YWJsZSBjYW4ndCBiZQphY3RpdmF0ZWQgb3RoZXJ3aXNlLiBPciwgc2lt
cGx5IHVzaW5nIGctc3RhZ2UgaW5zdGVhZCBvZiBzLXN0YWdlIGluIG9yZGVyCnRvIGdldCB0aGUg
TVNJIHRhYmxlIGVuYWJsZWQuIEluIHRoZSBlbmQsIEkgdGhpbmsgdGhlIGJlc3QgaXMgdG8gcmVx
dWlyZQpuZXN0ZWQgZm9yIGlycWJ5cGFzcyBhbmQgdGhpcyBzZXJpZXMgd2lsbCBwcm92aWRlIGEg
Z29vZCBiYXNlIGZvciB0aGF0LgoKSSdsbCByZWJhc2UgaXJxYnlwYXNzIG9uIHRoaXMgc2VyaWVz
IGFuZCB0ZXN0IGl0IG91dC4KClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
