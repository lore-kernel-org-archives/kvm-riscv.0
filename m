Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1523CA6019
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iafjW0qabJT7es92Fetbf6qqCZ0nCwj55IMrgIx2kxk=; b=qFpz9cBrzXILuf
	GlwG7bJl4Gf1+btHAwn66euFL4JsNxqQH+O3j7lV6KSddNG/NfRVrETCq1TjEiBuqWNI94Ijgwbk6
	Qn0wguE3Ax+gdmzUk5h5a0Bbk/SjRxB//y94ayFJtMNaWYI1IUTX7hSXmzYghzpWpQsJNlGzl/8Ph
	D3JRPmSOSk2JSYn/xDG89LNks1nfmhWV0WbT4eVZmcVu00A4qE++UhDgIedqeuGmOoUJzylVe5nKS
	xaeYiopNzwU79c/tYoOilZBAiBsV3L3AQ432Pr6l6fLnPS3LMAuU+qTaWjw37NIC9CkPcsDVdZ3qe
	3OIaWF1xmz1uIW+tWoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAtx-00000006OxC-1zCB;
	Fri, 09 Oct 2026 13:44:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAtt-00000006Ovp-47K0
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 13:44:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DK5so1754504
	for <kvm-riscv@lists.infradead.org>; Fri, 9 Oct 2026 13:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7o1DrLEcBNqQ1Flg54Ai3oN+ooXrDNjlEfZL6fV+XQ=; b=oNQzOqDfJ8E0CPBB
	Ja8vOPcar2eUVBtqsQBHGXD28HvyGnyzsjQ9uPF7ugOuJ4EissLWjdr+erCsSaRX
	5mDpDYapWDZqqMXPIhjE4O1vY+LzMX1RQdTP7kLU9psuxyyldBpNsAwy7R3vFaAE
	/K9bap81PxZ16S5dyAGRlNlAqdbtzkYUnhgDp4Mzq4HukEtqdpdP90vUiqHVlBkR
	hujCMycUkpxWfxYJ19O3QLes2JLvCe3kqohhszuorDMfg9Fwqa/PcdFXaXnrBQLN
	6YsJQXApC/yW09ZnMnR5pye3/K5ngUF270upxojLcm6/VIKvxNNHbXHgI2b/ePDT
	01ajHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgr0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 13:44:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso1393028485a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553480; x=1792158280; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7o1DrLEcBNqQ1Flg54Ai3oN+ooXrDNjlEfZL6fV+XQ=;
        b=dq24x8R+Nu2CP7SobIwK1Geckihme38K2uTV/l0gKm24QfC62ikvCfry/RNog6Ay+1
         dKulQcqNIZDXqqE6sfOrWqiKXBE2mqtFZh/RVxP1nRoyNGE7j/44Qk1GeV1uCCxLYF2u
         IpeJT4wi4elxPsWoElMecuVC4blEuh/wHYj+8IihQwAo1PEM9Rkq+3cy/ahTNxzhgiuR
         WyrgBbEaZQixkGCDLCNHr63oW2DQkmsOMdLJ+8Olzlnyb8kqDhDqoMw/Zi+wi/6BrHaq
         QLT3R6YeWAzCWzeFH2ZYDZ1VD/gfs/uIFoW1058xXnk45jdunWDujAGQ0d7VTlsdzs9V
         0gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553480; x=1792158280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f7o1DrLEcBNqQ1Flg54Ai3oN+ooXrDNjlEfZL6fV+XQ=;
        b=DzXvL5UVuI4KGqHLfsR+qCr1LVvF12Kd2sm8yiO5Tda86IbxTLgcoEJ/fdAFu91LsI
         JjLzWQEvgbU7YCBWaWUBEVpnvWb2IQA+CReFy58/8fLdzM2Mcy1uIyh/53r4mEZbY/hu
         dy5EbrJMUbZ9wWSkcfv0DuSB7QK8TE+6V3pmbip+2e9kcxbjshYlPYmpLf4YbjavssdB
         suFmyJgrwmX9DVigM14cJSrNweMi1gD2DVHGsUXZKRLX6E8ejbM8Dg4qwM7gmgX97bdp
         bQFOsVjzOFOX6vv3RefPZIE/yO2eh6CSz8XGmuLfMhxIpXl/nPfa78Uc5EfadkRMc9Wl
         fnsw==
X-Gm-Message-State: AFuF++nKhC3oLwZzEfeydavGtIXbdUMr2VNK25hpnf0gj9FSXMHt57qE
	Dfu+m2auirZulbOvyd5I+/dBVgC6BzNRj2VwYTxtaShyXyZg2ofhKsaeJDwoeCtZxG1z4buDzVv
	B38Rym1PEjtROBY5dpc+2Nx3cEexXM34aqvo/K3eKufPGa6MALBkRlBfSmG0e3ErV4Tsb
X-Gm-Gg: AYBFou2pcXESUhEnWdql2ZUSdcUPyVxX49RXInZsZOybOFm9zrJgKh+5SPbof2aomTE
	rPI2iEdGdng5zUpj2Du+sO+XrHs3AowfhrsFUjGbhqQ2bTpYxZ/Un5HzqLL0kqIRI4y8xGVaZqT
	ENjs96lFl9d4AKqjYeaEnt07/qVgxZ1gBL5mQs6LhVcQGJeaR1Gh7veZfqsaaTop5aHa9i6RRTG
	Qzn4tt+wVHNiLt6QpZcl6LJFo/+bYHFZMXMF6+MZ/Z5SNUshygIABWiWM8M8dkGqnDmC1Ds1zXP
	8A0AS+b9cBK/wTDfBVJCdNZBMYIryCbN7O6RJDyRnZxcDH2BYQwZtLJtZFJlo9wjrXkkoZcbm0G
	R22NLJpsTZ3IsSkrdKXFdkR+EJeMRbuwpju+YxA==
X-Received: by 2002:a05:620a:171e:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93ebd293de6mr253479285a.57.1791553479693;
        Fri, 09 Oct 2026 06:44:39 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93ebd293de6mr253474985a.57.1791553479218;
        Fri, 09 Oct 2026 06:44:39 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm81608725e9.0.2026.10.09.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:44:38 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:44:37 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
Message-ID: <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
 <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NCBTYWx0ZWRfX7ngTQqa+cOrk
 AIqh3FwRIzlx2mUm+pBQVqCYMPSzJ5d36G1f+qp6QS6rACc3F9NVOGApoZBlySu9wxVOtoVWOyS
 XgtJKrmUeCa85MTAOAlTPPXyDY24HKE=
X-Proofpoint-ORIG-GUID: vSm6zgDLeG_G3__S0LJoKI5bp1rUnBGb
X-Proofpoint-GUID: vSm6zgDLeG_G3__S0LJoKI5bp1rUnBGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NCBTYWx0ZWRfXzG4tiITvUCJh
 +0Pm/CBWd0v7HuenrKolxVTh5qJlpXpgmeTmH8EYIlOvUuQBZGkkamxUprMLZ2dUy9t59jKa9Of
 MkTj82XXTVv5QAbpnU8kiW/7Z+dXqF1GC+VGa3ykJt/a+HfGEpwSO9g9uN068LVblLL/d6iqCsJ
 z+XGRCBdRahZqcUJXjwji9/dcD5zWYvKJ1P+NQGZPO5Hrrv/DZiU5xRYhb4puRJiuwufnNFxjE2
 OjVWrmZw0H8GF2c54g543uyIUzxrn1p+nm82n3THLkM7yqoQDSjxsYq86hD0rrIysRlz5H0k7Jd
 CuVkSGXjyk9n8sRbRM07z/gBUYeRTpUdwOu1mGhb2/URqTspi3fAPw0di5+vpRky+xilmGB9Qfq
 DauNij+TL8vgrlIzqCMz4DHL2AzGcdWdeRPScREAKrc/G5tJCJ0tIAlzw5nD2VrByeILPyFmK1j
 MUnoe03Jqe+zeGGXADQ==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8efc8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=98eIWfJVglYkh31htLYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_064442_135658_CC719E6A 
X-CRM114-Status: GOOD (  15.15  )
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

SGkgQW51cCwKCk9uIEZyaSwgT2N0IDA5LCAyMDI2IGF0IDAxOjQ1OjIwUE0gKzAyMDAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgNTo1MeKAr1BNIEFuZHJldyBK
b25lcwo+IDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4ga3Zt
X3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dCgpIGNhbiBydW4gZnJvbSB0aGUgc2NoZWR1bGVyIHBy
ZWVtcHRpb24KPiA+IG5vdGlmaWVyIHdoaWxlIHRoZSByYXcgcnVucXVldWUgbG9jayBpcyBoZWxk
LiBUYWtpbmcgdnNmaWxlX2xvY2ssIGFuCj4gPiByd2xvY2tfdCwgdGhlcmUgdmlvbGF0ZXMgdGhl
IGxvY2tkZXAgd2FpdC1jb250ZXh0IHJ1bGVzLgo+ID4KPiA+IFByb3RlY3QgdGhlIENQVS9IR0VJ
IHBhaXIgd2l0aCBhIHNlcGFyYXRlIHJhdyBzcGlubG9jay4gQWxsIHVwZGF0ZXMgdG8KPiA+IHRo
YXQgcGFpciByZXRhaW4gdnNmaWxlX2xvY2sgYW5kIHRha2UgdGhlIG5ldyBsb2NrLCB3aGlsZSBz
Y2hlZHVsZXItb3V0Cj4gPiB1c2VzIG9ubHkgdGhlIG5ldyBsb2NrIGFyb3VuZCB0aGUgSEdFSUUg
dXBkYXRlLiBUaGlzIGtlZXBzIHRoZSB3YWtldXAKPiA+IHNldHVwIHNlcmlhbGl6ZWQgd2l0aCBW
Uy1maWxlIHB1YmxpY2F0aW9uIGFuZCByZWxlYXNlIHdpdGhvdXQgYnJpbmdpbmcKPiA+IHdpZGVy
IElNU0lDIG9wZXJhdGlvbnMgaW50byBhIHJhdyBjcml0aWNhbCBzZWN0aW9uLgo+IAo+IEluc3Rl
YWQgb2YgaW50cm9kdWNpbmcgYW5vdGhlciBsb2NrLCB3aHkgbm90IHJlcGxhY2UKPiByZWFkX2xv
Y2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgd2l0aAo+IHdyaXRlX2xvY2tf
aXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgaW4KPiBrdm1fcmlzY3ZfdmNwdV9h
aWFfaW1zaWNfcHV0KCkgPz8KClVuZm9ydHVuYXRlbHksIHdyaXRlX2xvY2tfaXJxc2F2ZSgpIGhh
cyB0aGUgc2FtZSBQUkVFTVBUX1JUIGlzc3VlLCBzaW5jZQpyd2xvY2tfdCBpcyBzbGVlcGFibGUg
b24gUlQgaW4gYm90aCBtb2Rlcy4KClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
